import 'package:flutter/material.dart';
import 'package:magic/widgets/main_screen/greeting_widget.dart';
import 'package:magic/widgets/main_screen/profile_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:20),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          GreetingWidget(),
          ProfileButton()
        ],
      ),
    );
  }
}
