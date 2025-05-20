import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: isArabic() ? 'Cairo' : 'Montserrat',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: Styles.font19Bold.copyWith(
        color: AppColors.charcoalBlack,
        fontFamily: isArabic() ? 'Cairo' : 'Montserrat'),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return Colors.white;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return AppColors.neutralColors400;
      },
    ),
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
);
