import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';

class CustomLeadingBackButton extends StatelessWidget {
  const CustomLeadingBackButton({super.key, this.paddingValue});
  final double? paddingValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.pop(),
        child: Padding(
          padding: isArabic()
              ? EdgeInsets.only(right: paddingValue ?? 15)
              : EdgeInsets.only(left: paddingValue ?? 15),
          child: Container(
              alignment: Alignment.center,
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColors.lighterGray),
              ),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 14,
              )),
        ));
  }
}
