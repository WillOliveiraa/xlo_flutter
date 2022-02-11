import 'package:flutter/material.dart';

class AppColors {
  static final kPrimaryColor = Color(0xFFFF7643);
  static final kPrimaryLightColor = Color(0xFFFFECDF);
  static final kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static final kSecondaryColor = Color(0xFF979797);
  static final kTextColor = Color(0xFF757575);
}
