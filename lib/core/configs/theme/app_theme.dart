import 'package:flutter/material.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lighBackground,
    brightness: Brightness.light,
    fontFamily: "Satoshi",
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    )),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: "Satoshi",
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    )),
  );
}
