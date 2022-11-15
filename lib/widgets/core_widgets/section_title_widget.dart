import 'package:flutter/material.dart';
import 'package:magic/resources/styles.dart';

class SectionTitleWidget extends StatelessWidget{
  final String titleText,subtitleText;
  const SectionTitleWidget({Key? key, required this.titleText, required this.subtitleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child:Text(
            titleText,
            style: titleMedium,
          )
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              subtitleText,
              style: subtitle,
            ),
          ),
        ),
      ],
    );
  }
}
