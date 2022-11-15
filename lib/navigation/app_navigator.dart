import 'package:flutter/material.dart';
import 'package:magic/models/session.dart';
import 'package:magic/screens/main_screen.dart';
import 'package:magic/screens/select_workout_screen.dart';
import 'package:magic/screens/workout_screen.dart';

class AppNavigator {
  static goToWorkoutScreen(BuildContext context, Session? session) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  WorkoutScreen(session: session,),
      ),
    );
  }

  static goToSelectWorkoutScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectWorkoutScreen(),
      ),
    );
  }

  static goToMainScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }
}
