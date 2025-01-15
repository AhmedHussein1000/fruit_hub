import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_screen_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomLeadingBackButton(),
      title: Text(S.of(context).payment),),
      body: const CheckoutScreenBody(),
    );
  }
}
