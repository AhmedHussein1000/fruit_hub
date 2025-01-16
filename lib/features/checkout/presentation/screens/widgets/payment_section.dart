import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section_widgets/delivery_address_widget.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section_widgets/order_summary.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        const OrderSummary(),
        SizedBox(
          height: 24.h,
        ),
        const DeliveryAddressWidget(),
      ],
    );
  }
}
