import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section_widgets/payment_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
        title: S.of(context).order_summary,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).sub_total} :',
                  style: Styles.font13Regular.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                Text(
                  S.of(context).numberOfPounds(150),
                  textAlign: TextAlign.right,
                  style: Styles.font16SemiBold
                      .copyWith(color: AppColors.charcoalBlack),
                )
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).delivery} :',
                  style: Styles.font13Regular.copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                Text(
                  S.of(context).numberOfPounds(30),
                  style: Styles.font13Regular.copyWith(
                    color: AppColors.darkGray,
                  ),
                )
              ],
            ),
            const CustomDivider(
              thickness: 0.5,
              color: Color(0xFFCACECE),
              height: 16,
              indent: 24,
              endIndent: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).total,
                  style: Styles.font16Bold
                      .copyWith(color: AppColors.charcoalBlack),
                ),
                Text(
                  S.of(context).numberOfPounds(150 + 30),
                  style: Styles.font16Bold,
                )
              ],
            ),
          ],
        ));
  }
}
