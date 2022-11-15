import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/providers/stored_sessions_provider.dart';
import 'package:magic/utils/hive_utils.dart';
import 'package:magic/navigation/app_navigator.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/styles.dart';
import 'package:magic/widgets/core_widgets/bordered_button.dart';
import 'package:magic/widgets/core_widgets/section_title_widget.dart';
import 'package:magic/widgets/workout/workout_card.dart';

class WorkoutScreen extends HookConsumerWidget {

  final Session? session;
 const  WorkoutScreen({Key? key, this.session}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWorkouts = ref.watch(selectedWorkoutsListProvider);
    return GestureDetector(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: accentColor),
            backgroundColor: primaryColor,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  opacity: selectedWorkouts.isEmpty?0:1,
                  child: Align(
                    alignment: Alignment.center,
                    child: BorderedButton(
                      onPressed: () {
                          if(ref.read(selectedWorkoutsListProvider.notifier).hasUnfinishedSets())
                            {
                              showDialog(context: context, builder: (_)=>AlertDialog(
                                backgroundColor: primaryColor,
                                actions: [
                                    BorderedButton(text: "Cancel", onPressed: (){
                                      Navigator.pop(context);
                                    }),
                                  BorderedButton(
                                    borderColor: Colors.red,
                                      text: "Discard Session", onPressed: (){
                                      AppNavigator.goToMainScreen(context);
                                  })
                                ],
                                title: const Text("Are you sure you want to End your workout?",style: titleMedium,),
                                content: const Text("You have untracked sets. Ending the session will discard the session data",style: subtitle,),
                              ));
                            }
                          else{
                            showDialog(context: context, builder: (_)=>AlertDialog(
                              backgroundColor: primaryColor,
                              actions: [
                                BorderedButton(
                                    borderColor: Colors.red,
                                    text: "Cancel", onPressed: (){
                                  Navigator.pop(context);
                                }),
                                BorderedButton(
                                    text: "Save Workout", onPressed: ()async{
                                      late Session currentSession;
                                      if(session!=null)
                                        {
                                          print("Session is not null");
                                          currentSession = session!.copyWith(date:session!.date, workouts: ref.read(selectedWorkoutsListProvider));
                                        }else{
                                        currentSession= Session(
                                            workouts: ref.read(selectedWorkoutsListProvider),
                                            date: DateTime.now());
                                      }
                                      HiveUtils.storeSession(currentSession).then((value){
                                        AppNavigator.goToMainScreen(context);
                                        ref.invalidate(selectedWorkoutsListProvider);
                                        return ref.refresh(storedSessionsProvider);
                                      });

                                })
                              ],
                              title: const Text("Are you sure you want to End your workout?",style: titleMedium,),
                              content: const Text("You will be able to edit your saved workout from you workouts screen.",style: subtitle,),
                            ));
                          }
                      },
                      text: session!=null?"Save":"End",
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                 SectionTitleWidget(
                    titleText: "Your workouts list",
                    subtitleText: selectedWorkouts.isNotEmpty?"Let's do something great":"You have no selected workouts"),
                selectedWorkouts.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedWorkouts.length,
                    itemBuilder: (context,index){
                      return WorkoutCard(workout: selectedWorkouts[index],);
                    },
                  ),
                ):Align(
                  alignment: Alignment.center,
                  child: BorderedButton(
                    text: "Select Workouts",
                    onPressed: () {
                      AppNavigator.goToSelectWorkoutScreen(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),),
      ),
      onTap: (){
        FocusScope.of(context).unfocus();
      },
    );
  }
}
