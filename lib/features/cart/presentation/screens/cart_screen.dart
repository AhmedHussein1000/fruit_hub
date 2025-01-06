import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_screen_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).cart),
        ),
        body: const CartScreenBody());
  }
}
