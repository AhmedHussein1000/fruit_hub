import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:intl/intl.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: Intl.defaultLocale=='ar' ? 'Cairo' : 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkGreenPrimaryColor,
  ),
  
);
