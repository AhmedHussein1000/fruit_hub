import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.socialImage,
      required this.socialTitle,
      required this.onPressed});
  final String socialImage;
  final String socialTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: AppColors.ashGray,
                  width: 1,
                ))),
        onPressed: onPressed,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(socialImage),
          title: Text(
            textAlign: TextAlign.center,
            socialTitle,
            style:
                Styles.font16SemiBold.copyWith(color: AppColors.charcoalBlack),
          ),
        ),
      ),
    );
  }
}
