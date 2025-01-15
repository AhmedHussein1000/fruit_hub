import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section_widgets/shipping_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
            isSelected: selectedIndex == 0,
            title: S.of(context).cash_on_delivery,
            subTitle: S.of(context).pickup_delivery_option,
            price: S.of(context).numberOfPounds(30),
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            }),
        SizedBox(
          height: 16.h,
        ),
        ShippingItem(
            isSelected: selectedIndex == 1,
            title: S.of(context).online_payment,
            subTitle: S.of(context).payment_method,
            price: S.of(context).free,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            })
      ],
    );
  }
}
