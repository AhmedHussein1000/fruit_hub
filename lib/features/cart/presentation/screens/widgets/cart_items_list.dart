import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItemEntity> cartItems =
        context.watch<CartCubit>().getCachedCartItems();
    return SliverList.separated(
        separatorBuilder: (context, index) => const CustomDivider(),
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.5.w),
              child: CartItem(
                cartItemEntity: cartItems[index],
              ),
            ),
        itemCount: cartItems.length);
  }
}
