import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
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
    this.textInputStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.keyboardType,
    this.onSaved,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextStyle? textInputStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.darkGreenPrimaryColor,
      controller: controller,
      onSaved: onSaved,
      validator: validator ??
          (value) {
            if (value.isNullOrEmpty()) {
              return S.of(context).field_required;
            } else {
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
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF6C7272)
            : AppColors.neutralWhite,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            Styles.font13Bold.copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.mediumNeutralGray
                    : null),
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
