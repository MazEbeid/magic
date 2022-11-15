import 'package:flutter/material.dart';
import 'package:magic/resources/styles.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Column(
        children:  [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: const Text("Hi, Mazen!",
                  textAlign: TextAlign.left,
                  style: titleLarge),
            )
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              textAlign: TextAlign.left,
              "Let's do something great today",
              style: subtitle,
            ),
          )
        ],
      ),
    );
  }
}
