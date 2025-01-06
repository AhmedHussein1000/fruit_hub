
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
           vertical: 10),
      
      color: AppColors.softMintGreen,
      child: Text(
        S.of(context).CartProductsCount(3),
        style: Styles.font13Regular
            .copyWith(color: AppColors.darkGreenPrimaryColor),
      ),
    );
  }
}
