import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:magic/models/workout.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session{
  Session._();
  @HiveType(typeId: 2,adapterName: "SessionAdapter")
  factory Session({
    @HiveField(0)
    required List<Workout> workouts,
    @HiveField(1)
     required DateTime date,
  }) = _Session;

}