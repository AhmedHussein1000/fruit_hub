import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: isArabic() ? 'Cairo' : 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkGreenPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: Styles.font19Bold.copyWith(
        color: AppColors.charcoalBlack,
        fontFamily:isArabic() ? 'Cairo' : 'Montserrat'
      ),
    ));
