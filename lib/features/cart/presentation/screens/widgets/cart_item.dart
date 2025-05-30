import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_item_action_buttons.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 92,
                width: 73,
                color: AppColors.lightBackground,
                child: CachedNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl ??
                        AppConstants.defultFruitImage),
              ),
              SizedBox(
                width: 17.w,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cartItemEntity.productEntity.name,
                        style: Styles.font13Bold,
                      ),
                      GestureDetector(
                          onTap: () => context
                              .read<CartCubit>()
                              .removeCartItem(cartItemEntity: cartItemEntity),
                          child: SvgPicture.asset(Assets.imagesTrash)),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    '${cartItemEntity.calculateTotalWeightforItem()} ${S.of(context).killo}',
                    style: Styles.font13Regular
                        .copyWith(color: AppColors.deepGoldenYellow),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartItemActionButtons(
                        cartItemEntity: cartItemEntity,
                      ),
                      Text(
                        S.of(context).numberOfPounds(
                            cartItemEntity.calculateTotalPriceforItem()),
                        style: Styles.font16Bold
                            .copyWith(color: AppColors.deepGoldenYellow),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
