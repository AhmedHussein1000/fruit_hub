import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/core/helpers/navigation_extension.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    executeNavigation(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(Assets.imagesPlant)),
          SvgPicture.asset(Assets.imagesFruitLogo),
          SvgPicture.asset(fit: BoxFit.fill, Assets.imagesSplashBottom),
        ],
      ),
    );
  }
}

void executeNavigation({required BuildContext context}) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      if (!context.mounted) return;
      isSkippedOnBoarding == true
          ? FirebaseAuthService().isLoggedIn()
              ? context.pushNamedAndRemoveUntil(
                  Routes.mainLayout,
                  predicate: (route) => false,
                )
              : context.pushNamedAndRemoveUntil(
                  Routes.login,
                  predicate: (route) => false,
                )
          : context.pushNamedAndRemoveUntil(
              Routes.onboarding,
              predicate: (route) => false,
            );
    },
  );
}
