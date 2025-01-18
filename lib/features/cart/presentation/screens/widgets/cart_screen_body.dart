import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/controller/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_header.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_items_list.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                const CartHeader(),
                SizedBox(
                  height: 24.h,
                ),
              ],
            )),
            const CartItemsList(),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 105.h,
            ))
          ],
        ),
        Positioned(
            right: 16.w,
            left: 16.w,
            bottom: 30.h,
            child: const CartPaymentButton()),
      ],
    );
  }
}

class CartPaymentButton extends StatelessWidget {
  const CartPaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<CartItemEntity>(HiveHelper.cartBox);
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              if (box.values.toList().isNotEmpty) {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen:  CheckoutScreen(cartEntity: context.read<CartCubit>().cartEntity,),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              } else {
                customToast(
                    message: S.of(context).cartIsEmpty,
                    state: ToastStates.warning);
              }
            },
            btnText:
                '${S.of(context).payment} ${S.of(context).numberOfPounds(context.watch<CartCubit>().calculateTotalPrice())}');
      },
    );
  }
}
