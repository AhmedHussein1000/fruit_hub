import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class ProductRate extends StatelessWidget {
  const ProductRate(
      {super.key, required this.averageRate, required this.ratingCount});
  final num averageRate;
  final num ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          color: AppColors.gold,
          size: 20,
        ),
        Text(
          averageRate.toString(),
          style: Styles.font13SemiBold,
        ),
        Text(
          " ($ratingCount)",
          style: Styles.font13Regular.copyWith(color: AppColors.softGray),
        ),
      ],
    );
  }
}
