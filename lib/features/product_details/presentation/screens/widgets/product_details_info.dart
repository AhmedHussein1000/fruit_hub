import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/product_details/presentation/screens/widgets/custom_product_info_container.dart';
import 'package:fruit_hub/features/product_details/presentation/screens/widgets/product_name_and_price.dart';
import 'package:fruit_hub/features/product_details/presentation/screens/widgets/product_rate.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameAndPrice(
            name: product.name,
            price: product.price,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ProductRate(
              averageRate: product.avgRating,
              ratingCount: product.ratingCount,
            ),
          ),
          Text(
            product.description,
            style:
                Styles.font13SemiBold.copyWith(color: const Color(0xFF969899)),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomProductInfoContainer(
                  title: product.expirationMonths < 1
                      ? S.of(context).less_than_a_month
                      : S.of(context).months_count(product.expirationMonths),
                  subtitle: S.of(context).expiration,
                  imageSrc: Assets.imagesExpiration,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: CustomProductInfoContainer(
                      title: product.isOrganic ? "100%" : "0%",
                      subtitle: S.of(context).organic,
                      imageSrc: Assets.imagesOrganic))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomProductInfoContainer(
                  title: S
                      .of(context)
                      .number_of_calories(product.numberOfCalories),
                  subtitle: S.of(context).number_of_grams(100),
                  imageSrc: Assets.imagesCalories,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: CustomProductInfoContainer(
                      title: product.avgRating.toString(),
                      ratingcount: "(${product.ratingCount})",
                      subtitle: S.of(context).reviews,
                      imageSrc: Assets.imagesGoldStar))
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartItemAdded) {
                customToast(
                    message: S.of(context).addedToCart,
                    state: ToastStates.success);
              }
            },
            builder: (context, state) {
              return CustomButton(
                  buttonText: S.of(context).add_to_cart,
                  onPressed: () {
                    context
                        .read<CartCubit>()
                        .addProductToCart(productEntity: product);
                  });
            },
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
