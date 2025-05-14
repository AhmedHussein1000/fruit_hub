import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.isActive, required this.stepNumber, required this.text});
  final bool isActive;
  final int stepNumber;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InactiveStepItem(stepNumber: stepNumber, text: text),
        secondChild: ActiveStepItem(text: text),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300));
  }
}

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.darkGreenPrimaryColor,
          child: Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Styles.font13Bold
              .copyWith(color: AppColors.darkGreenPrimaryColor),
        )
      ],
    );
  }
}

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem(
      {super.key, required this.stepNumber, required this.text});
  final int stepNumber;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.offWhite,
          child: Text(
            stepNumber.toString(),
            style:
                Styles.font13SemiBold.copyWith(color: AppColors.charcoalBlack),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Styles.font13SemiBold.copyWith(
            color: AppColors.lightSlateGray,
          ),
        ),
      ],
    );
  }
}
