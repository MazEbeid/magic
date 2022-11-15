import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/models/workout_set.dart';
import 'package:magic/navigation/app_navigator.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/widgets/core_widgets/bordered_button.dart';
import 'package:magic/widgets/core_widgets/section_title_widget.dart';
import 'package:magic/widgets/workout/workout_list_item.dart';

class SelectWorkoutScreen extends StatefulHookConsumerWidget {
  const SelectWorkoutScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelectWorkoutScreen> createState() => _SelectWorkoutScreenState();
}

class _SelectWorkoutScreenState extends ConsumerState<SelectWorkoutScreen> {
  late var deadlift,squats,barbellRow,shoulderPress,benchPress;
  @override
  void initState() {
    deadlift = Image.asset("assets/images/deadlift.jpg");
    squats = Image.asset("assets/images/squats.jpg");
    barbellRow = Image.asset("assets/images/barbell_row.png");
    shoulderPress = Image.asset("assets/images/shoulder_press.jpg");
    benchPress = Image.asset("assets/images/bench_press.jpg");
    super.initState();
  }
  @override
  void didChangeDependencies() {
    precacheImage(benchPress.image, context);
    precacheImage(deadlift.image, context);
    precacheImage(barbellRow.image, context);
    precacheImage(shoulderPress.image, context);
    precacheImage(squats.image, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final selectedWorkouts = ref.watch(selectedWorkoutsListProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
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
                        if(selectedWorkouts.isNotEmpty)
                        {
                          AppNavigator.goToWorkoutScreen(context,null);
                        }
                      },
                      text: "Continue",
                    ),
                  ),
                ),
              ),
            ],
            iconTheme: const IconThemeData(color: accentColor),
            backgroundColor: primaryColor,
          ),
          backgroundColor: Colors.black,
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SectionTitleWidget(titleText:"Select your workouts", subtitleText:"Select one or more workout to continue"),
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            children:   [
                              WorkoutListItem(
                                workout: Workout(
                                    sets: [WorkoutSet(number: "1",id: "benchpress1")],
                                    title: "Bench Press",
                                    level: "Beginner",
                                    imagePath: "assets/images/bench_press.jpg",
                                    muscleGroup: "Chest, Triceps and Core"),
                              ),
                              WorkoutListItem(
                                workout: Workout(
                                  sets: [WorkoutSet(number: "1",id: "deadlift1")],
                                    title: "Deadlift",
                                    level: "Intermediate",
                                    imagePath: "assets/images/deadlift.jpg",
                                    muscleGroup: "Back, Biceps and Glutes"),
                              ),
                              WorkoutListItem(
                                workout: Workout(
                                    sets: [WorkoutSet(number: "1",id: "barbelRow1")],
                                    title: "Barbell Row",
                                    level: "Advanced",
                                    imagePath: "assets/images/barbell_row.png",
                                    muscleGroup: "Back, Biceps and Glutes"),
                              ),
                              WorkoutListItem(
                                workout: Workout(
                                    title: "Shoulder Press",
                                    level: "Beginner",
                                    imagePath: "assets/images/shoulder_press.jpg",
                                    sets: [WorkoutSet(number: "1",id: "shoulderPress1")],
                                    muscleGroup: "Shoulders and Arms"),
                              ),
                              WorkoutListItem(
                                workout: Workout(
                                    sets: [WorkoutSet(number: "1",id: "squatPress1")],
                                    title: "Squats Press",
                                    level: "Advanced",
                                    imagePath: "assets/images/squats.jpg",
                                    muscleGroup: "Legs and Core"),
                              ),
                            ],
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}

