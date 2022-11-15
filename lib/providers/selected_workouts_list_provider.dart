import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/notifiers/selected_workouts_list_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final selectedWorkoutsListProvider = NotifierProvider<SelectedWorkoutsListNotifier, List<Workout>>((){
  return SelectedWorkoutsListNotifier();
});
