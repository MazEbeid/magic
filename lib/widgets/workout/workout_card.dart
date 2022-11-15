import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/resources/styles.dart';
import 'package:magic/widgets/workout/set_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WorkoutCard extends HookConsumerWidget {
  final Workout workout;
  WorkoutCard({Key? key, required this.workout}) : super(key: key);
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FocusNode addSetFocus = useFocusNode();
    final selectedWorkouts = ref.watch(selectedWorkoutsListProvider);
    final setsList = selectedWorkouts.firstWhere((element) => element.title == workout.title).sets;
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Card(
        elevation: 4,
        color: Colors.grey[900],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      workout.title,
                      style: titleMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(selectedWorkoutsListProvider.notifier)
                            .updateWorkoutsList(workout);
                      },
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SetWidget(
                workout: workout,
                setScrollController: itemScrollController,
                setPositionListener: itemPositionsListener,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  focusNode: addSetFocus,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    ref
                        .read(selectedWorkoutsListProvider.notifier)
                        .addSet(workout);
                    if (setsList.length >= 4) {
                      itemScrollController.scrollTo(
                          curve: Curves.easeInOutCubic,
                          index: setsList.length,
                          duration: const Duration(milliseconds: 600));
                    }
                  },
                  child: const Text(
                    "Add Set",
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
