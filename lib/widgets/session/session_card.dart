import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/navigation/app_navigator.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/providers/stored_sessions_provider.dart';
import 'package:magic/utils/hive_utils.dart';
import 'package:magic/resources/styles.dart';

class SessionCard extends HookConsumerWidget {
  final Session session;
  const SessionCard({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Card(
        color: Colors.grey[900],
        elevation: 2,
        child: Container(
            height: MediaQuery.of(context).size.height*0.2,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(session.date.toLocal().toString(),style: titleMedium.copyWith(color: Colors.white),),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:  IconButton(
                      onPressed: () async{
                        await HiveUtils.deleteSession(session);
                        return ref.refresh(storedSessionsProvider);
                      },
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: session.workouts.length,
                  itemBuilder: (context,index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(session.workouts[index].title, style:  titleMedium.copyWith(color: Colors.white),),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Sets: ${session.workouts[index].sets.length}",style:  titleMedium.copyWith(color: Colors.white),),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    ref.read(selectedWorkoutsListProvider.notifier).addSessionWorkouts(session);
                    AppNavigator.goToWorkoutScreen(context,session);
                  },
                  child: const Text(
                    "Edit",
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],)
        ),
      ),
      onTap: (){
        ref.read(selectedWorkoutsListProvider.notifier).addSessionWorkouts(session);
        AppNavigator.goToWorkoutScreen(context,session);
      },
    );
  }
}
