import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({
    super.key,
    required this.valueNotifierIsObscure,
    required this.controller,
    this.hintText,
  });

  final ValueNotifier<bool> valueNotifierIsObscure;
  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueNotifierIsObscure,
        builder: (context, value, child) => CustomTextFormField(
              controller: controller,
              validator: (value) {
                if (value.isNullOrEmpty()) {
                  return S.of(context).passwordRequired;
                }
                return null;
              },
              hintText: hintText ?? S.of(context).password,
              isObscureText: valueNotifierIsObscure.value,
              suffixIcon: IconButton(
                  onPressed: () {
                    valueNotifierIsObscure.value =
                        !valueNotifierIsObscure.value;
                  },
                  icon: value
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: AppColors.softGray,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: AppColors.softGray,
                        )),
            ));
  }
}
