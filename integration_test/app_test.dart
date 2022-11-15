import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:magic/main.dart' as app;
import 'package:magic/screens/main_screen.dart';
import 'package:magic/screens/select_workout_screen.dart';
import 'package:magic/screens/workout_screen.dart';
import 'package:magic/widgets/core_widgets/bordered_button.dart';
import 'package:magic/widgets/core_widgets/workout_text_field.dart';
import 'package:magic/widgets/session/session_card.dart';
import 'package:magic/widgets/workout/set_widget.dart';
import 'package:magic/widgets/workout/workout_list_item.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Log Session', () {
    testWidgets('Tap on new session button to continue',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();
          expect(find.byType(BorderedButton), findsOneWidget);
          await tester.tap(find.byType(BorderedButton));
          await tester.pumpAndSettle();
          expect(find.byType(SelectWorkoutScreen), findsOneWidget);
          await tester.tap(find.widgetWithText(WorkoutListItem, "Bench Press"));
          await tester.pumpAndSettle();
          expect(find.widgetWithText(BorderedButton, "Continue"), findsOneWidget);
          await tester.tap(find.widgetWithText(BorderedButton, "Continue"));
          await tester.pumpAndSettle();
          expect(find.byType(WorkoutScreen), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.byType(SetWidget), findsOneWidget);
          await tester.pumpAndSettle();
          await tester.enterText(find.byWidget(tester.widgetList<WorkoutTextField>(find.byType(WorkoutTextField)).elementAt(0)), "20");
          await tester.pumpAndSettle();
          await tester.enterText(find.byWidget(tester.widgetList<WorkoutTextField>(find.byType(WorkoutTextField)).elementAt(1)), "10");
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(TextButton, "Add Set"));
          await tester.pumpAndSettle();
          await tester.enterText(find.byWidget(tester.widgetList<WorkoutTextField>(find.byType(WorkoutTextField)).elementAt(2)), "25");
          await tester.pumpAndSettle();
          await tester.enterText(find.byWidget(tester.widgetList<WorkoutTextField>(find.byType(WorkoutTextField)).elementAt(3)), "8");
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(BorderedButton, "End"));
          await tester.pumpAndSettle();
          expect(find.byType(AlertDialog), findsOneWidget);
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(BorderedButton, "Save Workout"));
          await tester.pumpAndSettle();
          expect(find.byType(MainScreen), findsOneWidget);
          await tester.pumpAndSettle();
          expect(find.byType(SessionCard),findsOneWidget);
    });
  });
}