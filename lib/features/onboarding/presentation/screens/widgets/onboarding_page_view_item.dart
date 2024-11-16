import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem(
      {super.key,
      required this.backgroundImage,
      required this.foregroundFruitImage,
      required this.title,
      required this.description, this.isVisible});
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
                padding: const EdgeInsets.all(16),
                child:Visibility(
          visible: isVisible??true,child:  Text(
                  S.of(context).skip,
                ),),
              )
            ],
          ),
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 37),
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
