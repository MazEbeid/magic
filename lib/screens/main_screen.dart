import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/navigation/app_navigator.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/providers/stored_sessions_provider.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/widgets/core_widgets/bordered_button.dart';
import 'package:magic/widgets/core_widgets/loading_widget.dart';
import 'package:magic/widgets/main_screen/header_widget.dart';
import 'package:magic/widgets/main_screen/no_stored_workouts_widget.dart';
import 'package:magic/widgets/session/sessions_list_widget.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Session>> workoutsListAsyncValue =
        ref.watch(storedSessionsProvider);
    return SafeArea(
        child: Scaffold(
            backgroundColor: backgroundColor,
            body: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const HeaderWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  workoutsListAsyncValue.when(
                      data: (storedSessions) {
                        if (storedSessions.isEmpty) {
                          return const NoStoredWorkoutsWidget();
                        } else {
                          return SessionsListWidget(
                            storedSessionsList: storedSessions,
                          );
                        }
                      },
                      error: (error, trace) {
                        return Center(child: Text(trace.toString()));
                      },
                      loading: () => const LoadingWidget()),
                  Align(
                    alignment: Alignment.center,
                    child: BorderedButton(
                      text: "New Session",
                      onPressed: () {
                        ref.invalidate(selectedWorkoutsListProvider);
                        AppNavigator.goToSelectWorkoutScreen(context);
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
