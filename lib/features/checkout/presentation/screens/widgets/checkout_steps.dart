import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/step_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> steps = getSteps(context: context);
    return Row(
      children: List.generate(
          steps.length,
          (index) => Expanded(
              child: StepItem(
                  isActive: index == 0, stepNumber: index + 1, text: steps[index]))),
    );
  }

  List<String> getSteps({required BuildContext context}) => [
        S.of(context).shipping,
        S.of(context).address,
        S.of(context).payment,
      ];
}
