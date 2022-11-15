
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:magic/models/workout_set.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
class Workout with _$Workout{
  Workout._();
  @HiveType(typeId: 0,adapterName: "WorkoutAdapter")
   factory Workout({
    @HiveField(0)
    required String title,
    @HiveField(1)
    required String level,
    @HiveField(2)
    required String imagePath,
    @HiveField(3)
    required List<WorkoutSet> sets,
    @HiveField(4)
    String? muscleGroup,
}) = _Workout;

}
