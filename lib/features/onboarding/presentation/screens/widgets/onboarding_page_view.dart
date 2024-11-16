import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/features/onboarding/presentation/screens/widgets/onboarding_page_view_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});

  final  PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController ,
      children: [
        OnboardingPageViewItem(
            backgroundImage: Assets.imagesOnboardingItem1BackgroundImage,
            foregroundFruitImage: Assets.imagesOnboardingItem1Image,
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: S.of(context).welcome,
                  style: Styles.font23Bold
                      .copyWith(color: AppColors.charcoalBlack)),
              TextSpan(
                  text: 'Fruit',
                  style: Styles.font23Bold
                      .copyWith(color: AppColors.darkGreenPrimaryColor)),
              TextSpan(
                text: 'HUB',
                style: Styles.font23Bold
                    .copyWith(color: AppColors.deepGoldenYellow),
              ),
            ])),
            description: S.of(context).onboardingDescription1),
        OnboardingPageViewItem(
          isVisible: false,
            backgroundImage: Assets.imagesOnboardingItem2BackgroundImage,
            foregroundFruitImage: Assets.imagesOnboardingItem2Image,
            title: Text(
              S.of(context).onboardingTitle2,
              style: Styles.font23Bold.copyWith(color: AppColors.charcoalBlack),
            ),
            description: S.of(context).onboardingDescription2)
      ],
    );
  }
}
