import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: isArabic() ? 'Cairo' : 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkGreenPrimaryColor,
  ),
  
);
