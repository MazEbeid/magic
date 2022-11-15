import 'package:flutter/material.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/strings.dart';
import 'package:magic/resources/styles.dart';

class AppTheme{
  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        fontFamily: poppins,
        textTheme:  const TextTheme(
          titleLarge: titleLarge,
          titleSmall: subtitle,
          titleMedium:titleMedium),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),
          side: const BorderSide(color: accentColor)),
          buttonColor: primaryColor,
        ),
      backgroundColor: backgroundColor,
    );
  }
}