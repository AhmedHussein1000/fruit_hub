import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title :',
          style: Styles.font13Bold,
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.offWhite),
          child: child,
        )
      ],
    );
  }
}
