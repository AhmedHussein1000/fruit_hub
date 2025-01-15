import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section_widgets/active_dot.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section_widgets/in_active_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.isSelected,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.onTap});
  final bool isSelected;
  final String title;
  final String subTitle;
  final String price;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.veryLightGray,
          border: isSelected
              ? Border.all(width: 1, color: AppColors.darkGreenPrimaryColor)
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? const ActiveDot() : const InActiveDot(),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.font13SemiBold.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    subTitle,
                    style: Styles.font13Regular
                        .copyWith(color: AppColors.mediumBlack),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style:
                      Styles.font13Bold.copyWith(color: AppColors.natureGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
