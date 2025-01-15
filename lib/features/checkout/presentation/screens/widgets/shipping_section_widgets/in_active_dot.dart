import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

class InActiveDot extends StatelessWidget {
  const InActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
          width: 18,
          height: 18,
          decoration: const ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(width: 1, color: AppColors.mediumNeutralGray),
            ),
          ),
        );
  }
}