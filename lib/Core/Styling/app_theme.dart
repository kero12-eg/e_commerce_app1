import 'package:e_commerce_app/Core/Styling/app_fonts.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

class AppTheme {
  static ThemeData get lightcolor => ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.slide.toRight.withFade,
        TargetPlatform.iOS: GoTransitions.slide.toRight.withFade,
        TargetPlatform.macOS: GoTransitions.slide.toRight.withFade,
      },
    ),
    primaryColor: Appcolor.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFonts.mainfont,
    textTheme: TextTheme(
      titleLarge: AppStyle.headlinestyle,
      titleMedium: AppStyle.subheadlinestyle,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Appcolor.primarybackgroundbutton,
      disabledColor: Appcolor.placeholder,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
