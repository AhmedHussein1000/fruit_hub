import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartItemActionButton(
            backColor: AppColors.darkGreenPrimaryColor,
            icon: Icons.add,
            iconColor: Colors.white,
            onTap: () {}),
        Text(
          '3',
          style: Styles.font16Bold,
        ),
        CartItemActionButton(
          backColor: AppColors.lightBackground,
          icon: Icons.remove,
          iconColor: Colors.black,
          onTap: () {},
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.backColor,
      required this.icon,
      required this.iconColor,
      required this.onTap});
  final Color backColor;
  final IconData icon;
  final Color iconColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: backColor, shape: BoxShape.circle),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
