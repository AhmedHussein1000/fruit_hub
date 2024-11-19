
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/dont_have_an_account.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/login_with_email_and_password.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/or_divider.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/social_login_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            const LoginWithEmailAndPassword(),
            SizedBox(
              height: 33.h,
            ),
            const DontHaveAnAccount(),
            SizedBox(
              height: 33.h,
            ),
            const OrDivider(),
            SizedBox(
              height: 31.h,
            ),
            SocialLoginButton(
                socialImage: Assets.imagesGoogleIcon,
                socialTitle: S.of(context).loginWithGoogle,
                onPressed: () {
                  //TODO
                }),
            SizedBox(
              height: AppConstants.defaultPadding.h,
            ),
            SocialLoginButton(
                socialImage: Assets.imagesFacebookIcon,
                socialTitle: S.of(context).loginWithFacebook,
                onPressed: () {
                  //TODO
                }),
          ],
        ),
      ),
    );
  }
}
