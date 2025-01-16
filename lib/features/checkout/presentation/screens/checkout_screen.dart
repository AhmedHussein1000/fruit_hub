import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_user.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_screen_body.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
        uId: getUser()!.userId,
        cartEntity: widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingBackButton(),
        title: Text(S.of(context).payment),
      ),
      body: Provider.value(
        value: orderEntity,
        child: const CheckoutScreenBody(),
      ),
    );
  }
}
