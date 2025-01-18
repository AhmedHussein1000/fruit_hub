import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/adress_inputs_section.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/payment_section.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/shipping_section.dart';

class CheckoutStepsPageview extends StatelessWidget {
  const CheckoutStepsPageview({super.key, required this.pageController, required this.formKey, required this.valueListenableAutovalidateMode});
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenableAutovalidateMode;
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
        AdressInputsSection(formKey: formKey,
        valueNotifierAutovalidateMode: valueListenableAutovalidateMode,),
        const PaymentSection(),
      ];
}
