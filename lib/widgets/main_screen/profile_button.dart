import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/styles.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(10),
      shape:  const CircleBorder(side: BorderSide(color: accentColor)),
      onPressed: ()async {
        var box = await Hive.openBox("workouts");
        await box.clear();

      },
      child: Text(
        "M",
        style:titleLarge
            .copyWith(color: Colors.white),
      ),
    );
  }
}
