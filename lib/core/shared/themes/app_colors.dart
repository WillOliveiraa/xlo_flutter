import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color(0xFFE600E6);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF99FF), Color(0xFFE600E6)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);
}
