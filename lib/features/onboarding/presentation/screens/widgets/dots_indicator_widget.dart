import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 2,
      position: currentIndex,
      decorator: DotsDecorator(
        color: AppColors.midToneGreen.withOpacity(0.5),
        activeColor: AppColors.darkGreenPrimaryColor,
        size: const Size(9, 9),
        activeSize: const Size(11, 11),
      ),
    );
  }
}
