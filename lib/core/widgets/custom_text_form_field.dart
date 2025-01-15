import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/navigation_extension.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
     this.validator,
    required this.hintText,
    this.hintTextStyle,
    this.contentPadding,
    this.suffixIcon,
    this.isObscureText,
    this.fillColor,
    this.textInputStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Color? fillColor;
  final TextStyle? textInputStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ??
          (value) {
            if (value.isNullOrEmpty()) {
              return S.of(context).field_required;
            }
            else{
              return null;
            }
          },
      obscureText: isObscureText ?? false,
      keyboardType: keyboardType,
      style: textInputStyle ?? Styles.font16SemiBold,
      decoration: InputDecoration(
        enabledBorder: enabledBorder ?? customOutlineInputBorder(),
        focusedBorder: focusedBorder ?? customOutlineInputBorder(),
        errorBorder: customOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: customOutlineInputBorder(color: Colors.red),
        filled: true,
        fillColor: fillColor ?? AppColors.neutralWhite,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            Styles.font13Bold.copyWith(color: AppColors.mediumNeutralGray),
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder(
      {Color? color, double? width, double? radius}) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: color ?? AppColors.grayishWhite, width: width ?? 1),
      borderRadius: BorderRadius.circular(radius ?? 4),
    );
  }
}
