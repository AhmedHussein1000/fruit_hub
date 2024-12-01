import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions(
      {super.key, required this.isChecked, required this.onTap});
  final bool isChecked;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onTap: onTap),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).termsAgreement,
                  style: Styles.font13SemiBold
                      .copyWith(color: AppColors.mediumNeutralGray),
                ),
                const TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: S.of(context).ourTermsAndConditions,
                  style:
                      Styles.font13SemiBold.copyWith(color: AppColors.seaGreen),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onTap});
  final bool isChecked;
  final void Function() onTap;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            color: widget.isChecked
                ? AppColors.darkGreenPrimaryColor
                : AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.5,
                  color: widget.isChecked
                      ? Colors.transparent
                      : AppColors.ashGray),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: widget.isChecked
              ? Padding(
                  padding: const EdgeInsets.all(2),
                  child: SvgPicture.asset(Assets.imagesCheck),
                )
              : const SizedBox()),
    );
  }
}
