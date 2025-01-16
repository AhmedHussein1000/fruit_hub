import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section_widgets/payment_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: S.of(context).delivery_address,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            'شارع النيل مبنى 3 شقه 12',
            style: Styles.font13Regular.copyWith(
              color: AppColors.darkGray,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                Assets.imagesEdit,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                S.of(context).edit,
                style: Styles.font13SemiBold.copyWith(
                  color: AppColors.mediumNeutralGray,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
