import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/controllers/add_order_cubit/add_order_cubit.dart';
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
        uId: getCachedUser()!.userId,
        cartEntity: widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomLeadingBackButton(),
          title: Text(S.of(context).payment),
        ),
        body: Provider.value(
          value: orderEntity,
          child: const CheckoutScreenBody(),
        ),
      ),
    );
  }
}
