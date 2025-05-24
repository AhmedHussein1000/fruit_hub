import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: isArabic() ? 'Cairo' : 'Montserrat',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF1B1A1A),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: const Color(0xFF1B1A1A),
    elevation: 0,
    titleTextStyle: Styles.font19Bold
        .copyWith(fontFamily: isArabic() ? 'Cairo' : 'Montserrat'),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return Colors.white;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return AppColors.darkGreenPrimaryColor;
      },
    ),
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
  ),
);
