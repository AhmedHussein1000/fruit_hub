import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/adress_inputs_section.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section.dart';

class CheckoutStepsPageview extends StatelessWidget {
  const CheckoutStepsPageview({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getPages().length,
      itemBuilder: (context, index) => getPages()[index],
    );
  }

  List<Widget> getPages() => [
        const ShippingSection(),
        const AdressInputsSection(),
        const PaymentSection(),
      ];
}
