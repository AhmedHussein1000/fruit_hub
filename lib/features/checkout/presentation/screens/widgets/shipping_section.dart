import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section_widgets/shipping_item.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin{
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        ShippingItem(
            isSelected: selectedIndex == 0,
            title: S.of(context).cash_on_delivery,
            subTitle: S.of(context).pickup_delivery_option,
            price: S.of(context).numberOfPounds(orderEntity.shippingCost),
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              orderEntity.payWithCash = true;
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
              orderEntity.payWithCash = false;
            })
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
