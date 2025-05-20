import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.textStyle,
      this.backgroundColor,
      this.padding,
      this.borderRadius,
      this.width,
      this.height});
  final void Function() onPressed;
  final String buttonText;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16)),
      height: height?.h ?? 54,
      minWidth: width?.w ?? double.infinity,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
      color: backgroundColor ?? AppColors.darkGreenPrimaryColor,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle ?? Styles.font16Bold.copyWith(color: Colors.white),
      ),
    );
  }
}
