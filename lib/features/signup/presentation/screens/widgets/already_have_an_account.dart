import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).alreadyHaveAnAccount,
            style: Styles.font16SemiBold
                .copyWith(color: AppColors.mediumNeutralGray)),
        const Text(' '),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text(
            S.of(context).login,
            style: Styles.font16SemiBold
                .copyWith(color: AppColors.darkGreenPrimaryColor),
          ),
        )
      ],
    );
  }
}