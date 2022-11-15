
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'workout_set.freezed.dart';
part 'workout_set.g.dart';
@freezed
class WorkoutSet with _$WorkoutSet{
  @HiveType(typeId: 1,adapterName: "WorkoutSetAdapter")
  factory WorkoutSet({
    @HiveField(1)
    required String number,
    @HiveField(2)
    String? reps,
    @HiveField(3)
    String? weight,
    @HiveField(4)
    String? id,
  }) = _WorkoutSet;

}