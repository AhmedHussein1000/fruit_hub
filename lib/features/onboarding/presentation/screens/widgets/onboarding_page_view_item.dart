import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/core/helpers/navigation_extension.dart';
import 'package:fruit_hub/core/helpers/size_config.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem(
      {super.key,
      required this.backgroundImage,
      required this.foregroundFruitImage,
      required this.title,
      required this.description,
      this.isVisible});
  final String backgroundImage;
  final String foregroundFruitImage;
  final Widget title;
  final String description;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    foregroundFruitImage,
                  )),
              Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Visibility(
                  visible: isVisible ?? true,
                  child: InkWell(
                    onTap: () {
                      CacheHelper.saveData(
                          key: CacheHelper.onBoardingKey, value: true);
                     context.pushReplacementNamed(Routes.login);   

                    },
                    child: Text(
                      S.of(context).skip,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizeConfig.screenHeight > 730
            ? SizedBox(height: 64.h)
            : SizedBox(height: 24.h),
        title,
        SizeConfig.screenHeight > 730
            ? SizedBox(height: 24.h)
            : SizedBox(height: 10.h),
        Padding(
          padding: SizeConfig.screenWidth > 400
              ? EdgeInsets.symmetric(horizontal: 37.w)
              : EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Styles.font13SemiBold.copyWith(color: AppColors.darkGray),
          ),
        ),
      ],
    );
  }
}
