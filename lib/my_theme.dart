import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimary = Color(0XFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0XFFDFECDB);
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC44B4B);
  static final  lightTheme = ThemeData(
    primaryColor: lightPrimary,
    textTheme: TextTheme(
        bodyMedium:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
      titleMedium:TextStyle(
        fontSize: 19
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w500
      )
    ),
    scaffoldBackgroundColor: lightScaffoldBackground,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 30
      ),
      unselectedIconTheme: IconThemeData(
        size: 30
      )
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white
    )
  );



}