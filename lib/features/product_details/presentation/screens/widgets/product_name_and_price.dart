import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.price,
    required this.name,
  });
  final num price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          name,
          style: Styles.font16Bold,
        ),
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).numberOfPounds(price),
                style: Styles.font13Bold
                    .copyWith(color: AppColors.deepGoldenYellow),
              ),
              TextSpan(
                text: S.of(context).slash,
                style: Styles.font13Bold.copyWith(color: AppColors.lightGold),
              ),
              const TextSpan(text: " "),
              TextSpan(
                text: S.of(context).killo,
                style:
                    Styles.font13SemiBold.copyWith(color: AppColors.lightGold),
              ),
            ],
          ),
        ));
  }
}
