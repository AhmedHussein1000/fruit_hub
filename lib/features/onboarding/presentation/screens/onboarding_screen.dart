import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/helpers/size_config.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/onboarding/presentation/screens/widgets/dots_indicator_widget.dart';
import 'package:fruit_hub/features/onboarding/presentation/screens/widgets/onboarding_page_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: OnboardingPageView(
              pageController: pageController,
            )),
            DotsIndicatorWidget(currentIndex: currentIndex),
            SizedBox(height: 29.h),
            Visibility(
                visible: currentIndex == 1,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding),
                  child: CustomButton(
                      onPressed: () {
                        CacheHelper.saveData(
                            key: CacheHelper.onBoardingKey, value: true);
                        context.pushNamedAndRemoveUntil(
                          Routes.login,
                          predicate: (route) => false,
                        );
                      },
                      buttonText: S.of(context).startNow),
                )),
            SizeConfig.screenHeight > 730 && SizeConfig.screenWidth > 390
                ? SizedBox(
                    height: 43.h,
                  )
                : SizedBox(
                    height: 25.h,
                  ),
          ],
        ),
      ),
    );
  }
}
