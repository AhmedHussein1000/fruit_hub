import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section_widgets/payment_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.pageController});
  final PageController pageController;
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
          Expanded(
            child: Text(
              context
                  .read<OrderEntity>()
                  .shippingAddressEntity
                  .addressToString(),
              style: Styles.font13Regular.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Row(
            children: [
              SvgPicture.asset(
                Assets.imagesEdit,
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Text(
                  S.of(context).edit,
                  style: Styles.font13SemiBold.copyWith(
                    color: AppColors.mediumNeutralGray,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
