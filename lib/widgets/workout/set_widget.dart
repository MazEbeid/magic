import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/styles.dart';
import 'package:magic/widgets/core_widgets/workout_text_field.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SetWidget extends HookConsumerWidget {
  const SetWidget(
      {Key? key,
      required this.workout,
      required this.setScrollController,
      required this.setPositionListener})
      : super(key: key);
  final Workout workout;
  final ItemScrollController setScrollController;
  final ItemPositionsListener setPositionListener;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWorkouts = ref.watch(selectedWorkoutsListProvider);
    final setsList = selectedWorkouts
        .firstWhere((element) => element.title == workout.title)
        .sets;
    final List<FocusNode> weightFocusNodes =
        List.generate(setsList.length, (index) => useFocusNode());
    final List<FocusNode> repsFocusNodes =
        List.generate(setsList.length, (index) => useFocusNode());
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      height: setsList.length < 4
          ? MediaQuery.of(context).size.height * 0.082 * setsList.length
          : MediaQuery.of(context).size.height * 0.082 * 4,
      child: ScrollablePositionedList.builder(
        itemScrollController: setScrollController,
        itemPositionsListener: setPositionListener,
        itemCount: setsList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            key: ValueKey(setsList[index].id),
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    setsList.elementAt(index).number,
                    style: titleMedium.copyWith(color: Colors.white),
                  ),
                ),
                WorkoutTextField(
                  allowDecimal: true,
                  focusNode: weightFocusNodes[index],
                  value: setsList[index].weight,
                  hint: "Weight",
                  onChanged: (weight) {
                    ref.read(selectedWorkoutsListProvider.notifier).updateWeight(workout, setsList[index], weight);
                  },
                  onCompleted: () {
                    FocusScope.of(context).requestFocus(repsFocusNodes[index]);
                  },
                ),
                WorkoutTextField(
                  allowDecimal: false,
                  focusNode: repsFocusNodes[index],
                  value: setsList[index].reps,
                  hint: "Reps",
                  onChanged: (reps) {
                    ref.read(selectedWorkoutsListProvider.notifier).updateReps(workout, setsList[index], reps);
                  },
                  onCompleted: () {
                    if(index+1<setsList.length)
                      {
                        FocusScope.of(context).requestFocus(weightFocusNodes[index+1]);
                      }else{
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
                IconButton(
                  onPressed: () {
                    ref.read(selectedWorkoutsListProvider.notifier).removeSet(workout, setsList.elementAt(index));
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.remove,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
