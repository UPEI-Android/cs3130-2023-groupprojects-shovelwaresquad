
import 'package:flutter/material.dart';

class CustomThemeApp {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    backgroundColor: Colors.green,
    cardColor: Colors.white70,
    splashColor: Colors.white
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    backgroundColor: Colors.amber,
  );
}