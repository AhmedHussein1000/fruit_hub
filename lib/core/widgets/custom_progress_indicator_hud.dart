import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';

class CustomProgressIndicatorHud extends StatelessWidget {
  const CustomProgressIndicatorHud(
      {super.key,
      required this.child,
      required this.isLoading,
      this.indicatorColor});
  final Widget child;
  final bool isLoading;
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          child,
          Container(
            color: AppColors.black.withAlpha((0.5 * 255).toInt()),
            child: Center(
              child: CircularProgressIndicator(
                color: indicatorColor ?? AppColors.darkGreenPrimaryColor,
              ),
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}
