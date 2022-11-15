import 'package:flutter/material.dart';
import 'package:magic/models/session.dart';
import 'package:magic/widgets/core_widgets/section_title_widget.dart';
import 'package:magic/widgets/session/session_card.dart';

class SessionsListWidget extends StatelessWidget {
  final List<Session> storedSessionsList;
  const SessionsListWidget({Key? key, required this.storedSessionsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitleWidget(
            titleText: "Your previous workouts",
            subtitleText:
            ""),
        SizedBox(
          height:MediaQuery.of(context).size.height*0.62,
          child: ListView.builder(
            itemBuilder: (context,index){
              return SessionCard(session:storedSessionsList[index]);
            },
            itemCount: storedSessionsList.length,
          ),
        ),
      ],
    );
  }
}
