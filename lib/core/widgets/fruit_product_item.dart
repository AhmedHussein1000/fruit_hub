import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FruitProductItem extends StatelessWidget {
  const FruitProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
                onPressed: () {
                  //TODO later
                },
                icon: const Icon(
                  Icons.favorite_outline,
                  size: 16,
                )),
          ),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl:
                        productEntity.imageUrl ?? AppConstants.defultFruitImage,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      productEntity.name,
                      style: Styles.font13SemiBold,
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S
                                .of(context)
                                .numberOfPounds(productEntity.price),
                            style: Styles.font13Bold
                                .copyWith(color: AppColors.deepGoldenYellow),
                          ),
                          TextSpan(
                            text: S.of(context).slash,
                            style: Styles.font13Bold
                                .copyWith(color: AppColors.lightGold),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: S.of(context).killo,
                            style: Styles.font13SemiBold
                                .copyWith(color: AppColors.lightGold),
                          ),
                        ],
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        context
                            .read<CartCubit>()
                            .addProductToCart(productEntity: productEntity);
                        customToast(message:  S.of(context).addedToCart,state:ToastStates.success,toastLength: Toast.LENGTH_SHORT);    
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        height: 36.h,
                        width: 36.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.darkGreenPrimaryColor),
                        child: const Center(
                            child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
