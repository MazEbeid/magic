import 'package:flutter/widgets.dart';
import 'package:magic/widgets/core_widgets/section_title_widget.dart';

class NoStoredWorkoutsWidget extends StatelessWidget {
  const NoStoredWorkoutsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionTitleWidget(
            titleText: "Your previous workouts",
            subtitleText:
            "You currently have no recorded workouts. Would you like to start a new session?"),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
