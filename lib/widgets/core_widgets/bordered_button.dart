import 'package:flutter/material.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/styles.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? borderColor;
  const BorderedButton({Key? key, required this.text, required this.onPressed, this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      height: 40,
      shape: Border.all(color: borderColor??accentColor),
      onPressed: () async {
        onPressed();
      },
      child:Text(
        text,
        style:borderColor==null?buttonTextStyle:buttonTextStyle.copyWith(color: borderColor),
      ),
    );
  }
}
