import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartItemActionButton(
            backColor: AppColors.darkGreenPrimaryColor,
            icon: Icons.add,
            iconColor: Colors.white,
            onTap: () {
              cartItemEntity.icreaseQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            }),
        Text(
          '${cartItemEntity.quantity}',
          style: Styles.font16Bold,
        ),
        CartItemActionButton(
          backColor: AppColors.lightBackground,
          icon: Icons.remove,
          iconColor: Colors.black,
          onTap: () {
            cartItemEntity.decreaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
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
