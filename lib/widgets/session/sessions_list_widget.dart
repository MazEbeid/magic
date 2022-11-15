import 'package:flutter/material.dart';
import 'package:magic/models/session.dart';
import 'package:magic/widgets/core_widgets/section_title_widget.dart';
import 'package:magic/widgets/session/session_card.dart';

class SessionsListWidget extends StatelessWidget {
  final List<Session> storedSessionsList;
  const SessionsListWidget({Key? key, required this.storedSessionsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SectionTitleWidget(
              titleText: "Your previous workouts",
              subtitleText:storedSessionsList.length>1? "Great job! you have logged ${storedSessionsList.length} workouts": "Great job! you have logged 1 workout"),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SessionCard(session: storedSessionsList[index]);
              },
              itemCount: storedSessionsList.length,
            ),
          )
        ],
      ),
    );
  }
}
