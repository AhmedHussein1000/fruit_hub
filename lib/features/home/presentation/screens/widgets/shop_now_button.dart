import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({super.key, required this.onPressed});
final  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 28),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            S.of(context).shopNow,
            style: Styles.font13Bold
                .copyWith(color: AppColors.darkGreenPrimaryColor),
          ),
        ),
      ),
    );
  }
}
