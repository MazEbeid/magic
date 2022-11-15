import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/models/workout.dart';
import 'package:magic/models/workout_set.dart';
import 'package:magic/screens/main_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(WorkoutAdapter());
   Hive.registerAdapter(WorkoutSetAdapter());
   Hive.registerAdapter(SessionAdapter());
  runApp(const ProviderScope(child:  MaterialApp(
    home: MainScreen(),
  ),));
}
