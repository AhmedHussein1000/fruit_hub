import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:intl/intl.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: Intl.defaultLocale=='ar' ? 'Cairo' : 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkGreenPrimaryColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: Styles.font19Bold.copyWith(color: AppColors.charcoalBlack),

  )
  
);
