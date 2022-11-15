import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/resources/styles.dart';


class WorkoutListItem extends StatefulHookConsumerWidget {
  final Workout workout;
  const WorkoutListItem({Key? key,required this.workout}) : super(key: key);

  @override
  ConsumerState<WorkoutListItem> createState() => _WorkoutListItemState();
}

class _WorkoutListItemState extends ConsumerState<WorkoutListItem> {

  @override
  Widget build(BuildContext context) {
    final selectedList = ref.watch(selectedWorkoutsListProvider);
    return InkWell(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.44,
        child: Stack(
          children: [
            Image.asset(
              widget.workout.imagePath,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Align(
              alignment: Alignment.topRight,
              child:selectedList.contains(widget.workout)
                  ? const Icon(
                Icons.circle,
                color: Colors.white,
              )
                  : const Icon(
                Icons.circle_outlined,
                color: Colors.white,
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Chip(
                    backgroundColor: Colors.white,
                    label: Text(
                      widget.workout.level,
                      style: chipTextStyle,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.44,
                color: Colors.black45,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.workout.title,
                        style: titleMedium.copyWith(color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.workout.muscleGroup!,
                        style: subtitle.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        ref.read(selectedWorkoutsListProvider.notifier).updateWorkoutsList(widget.workout);
        // AppNavigator.goToWorkoutScreen(context, workout);
      },
    );
  }
}

