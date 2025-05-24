import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class CustomProductInfoContainer extends StatelessWidget {
  const CustomProductInfoContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageSrc,
    this.ratingcount = '',
    this.isRateWidget = false,
  });
  final String title, subtitle, imageSrc, ratingcount;
  final bool isRateWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.lighterGray),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        title: isRateWidget
            ? Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: ratingcount,
                    style: Styles.font13SemiBold
                        .copyWith(color: AppColors.lighterGray),
                  ),
                  TextSpan(
                    text: title,
                    style: Styles.font16Bold
                        .copyWith(color: const Color(0xFF23AA49)),
                  ),
                ],
              ))
            : Text(
                title,
                style:
                    Styles.font16Bold.copyWith(color: const Color(0xFF23AA49)),
              ),
        subtitle: Text(
          subtitle,
          style: Styles.font13SemiBold.copyWith(color: const Color(0xFF969899)),
        ),
        trailing: SvgPicture.asset(
          imageSrc,
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
