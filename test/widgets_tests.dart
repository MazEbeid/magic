import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/providers/selected_workouts_list_provider.dart';
import 'package:magic/screens/select_workout_screen.dart';
import 'package:magic/widgets/workout/workout_list_item.dart';

void main() {
  testWidgets('SelectWorkoutScree should have 5 WorkListItems',
      (tester) async {
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
      home: SelectWorkoutScreen(),
    )));
    expect(find.byType(WorkoutListItem), findsNWidgets(5));
  });

  testWidgets('When a workout is selected workouts list should have one item',
          (tester) async {
        await tester.pumpWidget(
            const ProviderScope(
            child: MaterialApp(
              home: SelectWorkoutScreen(),
            )));
        final context = tester.element(find.byType(SelectWorkoutScreen));
        final providerContainter = ProviderScope.containerOf(context);
        await tester.tap(find.widgetWithText(WorkoutListItem, "Bench Press"));
        expect(providerContainter.read(selectedWorkoutsListProvider).length, 1);

      });

  testWidgets('When a workout is selected and then unselected the workouts list should have zero items',
          (tester) async {
        await tester.pumpWidget(
            const ProviderScope(
                child: MaterialApp(
                  home: SelectWorkoutScreen(),
                )));
        final context = tester.element(find.byType(SelectWorkoutScreen));
        final providerContainter = ProviderScope.containerOf(context);
        await tester.tap(find.widgetWithText(WorkoutListItem, "Bench Press"));
        expect(providerContainter.read(selectedWorkoutsListProvider).length, 1);
        await tester.tap(find.widgetWithText(WorkoutListItem, "Bench Press"));
        expect(providerContainter.read(selectedWorkoutsListProvider).length, 0);
      });



}
