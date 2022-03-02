import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData buildTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.kPrimaryColor,
    primarySwatch: Colors.purple,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18),
    elevation: 0,
    // ignore: deprecated_member_use
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    // ignore: deprecated_member_use
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}
