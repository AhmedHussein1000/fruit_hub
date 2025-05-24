import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).dontHaveAnAccount,
            style: Styles.font16SemiBold
                .copyWith(color: AppColors.mediumNeutralGray)),
        const Text(' '),
        GestureDetector(
          onTap: () => context.pushNamed(Routes.signup),
          child: Text(
            S.of(context).signup,
            style: Styles.font16SemiBold
                .copyWith(color: AppColors.darkGreenPrimaryColor),
          ),
        )
      ],
    );
  }
}
