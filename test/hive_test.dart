
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:magic/models/session.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/models/workout_set.dart';
import 'package:magic/utils/hive_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() async {
    await setUpTestHive();
    Hive.registerAdapter(WorkoutAdapter());
    Hive.registerAdapter(WorkoutSetAdapter());
    Hive.registerAdapter(SessionAdapter());
  });

  test('When no recorded sessions are available getStoredSessions should return an empty list', () async{
    final List<Session> storedWorkouts = await HiveUtils.getStoredSessions();
    expect(storedWorkouts.length, 0);
  });

  test('When a session is added storeSession should update the sessions list', () async{
    Session session = Session(workouts: [Workout(title: "Test workout", level: "beginner", imagePath: "", sets: [WorkoutSet(number: "1",reps: "10",weight: "10")])], date: DateTime.now());
    await HiveUtils.storeSession(session);
    final List<Session> storedWorkouts = await HiveUtils.getStoredSessions();
    expect(storedWorkouts.length, 1);
  });

  test('When a session is added getStoredSessions should return a list containing the session', () async{
    Session session = Session(workouts: [Workout(title: "Test workout", level: "beginner", imagePath: "", sets: [WorkoutSet(number: "1",reps: "10",weight: "10")])], date: DateTime.now());
    await HiveUtils.storeSession(session);
    final List<Session> storedWorkouts = await HiveUtils.getStoredSessions();
    expect(storedWorkouts.length, 1);
  });

  test('When a session is deleted deleteSession should remove the session from the list', () async{
    Session session = Session(workouts: [Workout(title: "Test workout", level: "beginner", imagePath: "", sets: [WorkoutSet(number: "1",reps: "10",weight: "10")])], date: DateTime.now());
    await HiveUtils.storeSession(session);
    await HiveUtils.deleteSession(session);
    final List<Session> updatedSessions = await HiveUtils.getStoredSessions();
    expect(updatedSessions.length, 0);
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}
