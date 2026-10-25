import 'package:flutter/material.dart';
class Constants{

  static String appName = "Social app";

  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.green;
  static Color darkAccent = Colors.greenAccent;
  static Color lightBG = Colors.white;
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    textSelectionTheme: TextSelectionThemeData(cursorColor: lightAccent),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(cursorColor: darkAccent),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );


}