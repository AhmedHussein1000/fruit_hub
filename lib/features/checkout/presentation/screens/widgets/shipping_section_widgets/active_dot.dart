import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

class ActiveDot extends StatelessWidget {
  const ActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 18,
          height: 18,
          decoration: const ShapeDecoration(
            color: AppColors.darkGreenPrimaryColor,
            shape: OvalBorder(
              side: BorderSide(width: 4, color: Colors.white),
            ),
          ),
        );
  }
}