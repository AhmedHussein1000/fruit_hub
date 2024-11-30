import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.ashGray,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            S.of(context).or,
            style: Styles.font16SemiBold
                .copyWith(color: AppColors.deepForestGreen),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.ashGray,
          ),
        ),
      ],
    );
  }
}
