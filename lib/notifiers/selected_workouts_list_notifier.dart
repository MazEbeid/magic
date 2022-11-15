import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/models/workout_set.dart';

class SelectedWorkoutsListNotifier extends Notifier<List<Workout>>{
  @override
  List<Workout> build() {
    return [];
  }
  List<Workout> addSessionWorkouts(Session session)
  {
    state.clear();
    for(Workout workout in session.workouts)
    {
      state.add(workout);
    }
    state = [...state];
    return state;
  }
  List<Workout> updateWorkoutsList(Workout workout)
  {

    if(!state.contains(workout))
      {
        state.add(workout);
      }else{
      state.remove(workout);
    }
    state = [...state];
    return state;
  }

  List<Workout> addSet(Workout w)
  {
    List<WorkoutSet> updatedSets = w.sets.toList();
    List<Workout> updatedWorkouts = state.toList();
    updatedSets.add(WorkoutSet(number: (updatedSets.length+1).toString(),id: w.title+(updatedSets.length+1).toString()));
    for(int i=0; i<updatedWorkouts.length; i++)
    {
      if(updatedWorkouts[i].title==w.title)
      {
        updatedWorkouts[i]=w.copyWith(sets: updatedSets);
      }
    }
    state = updatedWorkouts;
    return state;
  }

  List<Workout> removeSet(Workout w, WorkoutSet set)
  {
    List<WorkoutSet> updatedSets = w.sets.toList();
    List<Workout> updatedWorkouts = state.toList();
    if(updatedSets.length>1)
      {
        updatedSets.removeWhere((element) => element.number==set.number);
        for(int i=0; i<updatedSets.length; i++)
          {
            updatedSets[i] = updatedSets[i].copyWith(number: (i+1).toString(),reps: updatedSets[i].reps, weight: updatedSets[i].weight);
          }
        for(int i=0; i<updatedWorkouts.length; i++)
        {
          if(updatedWorkouts[i].title==w.title)
          {
            updatedWorkouts[i]=w.copyWith(sets: updatedSets);
          }
        }
      }
    state = updatedWorkouts;
    return state;
  }

  List<Workout> updateWeight(Workout w, WorkoutSet set, String updatedWeight)
  {
    List<WorkoutSet> updatedSets = w.sets.toList();
    List<Workout> updatedWorkouts = state.toList();
    for(int i=0; i<updatedSets.length; i++)
    {
      updatedSets[i] = updatedSets[i].copyWith(weight: updatedWeight);
    }
    for(int i=0; i<updatedWorkouts.length; i++)
    {
      if(updatedWorkouts[i].title==w.title)
      {
        updatedWorkouts[i]=w.copyWith(sets: updatedSets);
      }
    }
    state = updatedWorkouts;
    return state;
  }

  List<Workout> updateReps(Workout w, WorkoutSet set, String updatedReps)
  {
    List<WorkoutSet> updatedSets = w.sets.toList();
    List<Workout> updatedWorkouts = state.toList();
    for(int i=0; i<updatedSets.length; i++)
    {
      updatedSets[i] = updatedSets[i].copyWith(reps: updatedReps);
    }
    for(int i=0; i<updatedWorkouts.length; i++)
    {
      if(updatedWorkouts[i].title==w.title)
      {
        updatedWorkouts[i]=w.copyWith(sets: updatedSets);
      }
    }
    state = updatedWorkouts;
    return state;
  }

  bool hasUnfinishedSets()
  {
    for(Workout w in state)
      {
        for(WorkoutSet set in w.sets)
          {
            if(set.reps==null||set.weight==null||set.reps!.isEmpty||set.weight!.isEmpty)
              {
                return true;
              }
          }
      }
    return false;
  }

}

