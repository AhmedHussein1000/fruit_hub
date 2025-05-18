import 'package:flutter/material.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/functions/custom_dialog.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customDialog(
            context: context,
            onConfirm: () {
              context.pop();
              getIt<FirebaseAuthService>().signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.login, (route) => false);
            },
            title: S.of(context).signout_message);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              S.of(context).logout,
              textAlign: TextAlign.center,
              style: Styles.font16SemiBold.copyWith(
                color: AppColors.darkGreenPrimaryColor,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.logout,
              color: AppColors.brightRed,
            ),
          ],
        ),
      ),
    );
  }
}
