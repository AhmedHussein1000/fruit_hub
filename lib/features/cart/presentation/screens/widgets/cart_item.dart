import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            height: 92,
            width: 73,
            color: AppColors.lightBackground,
            child: CachedNetworkImage(imageUrl: AppConstants.defultFruitImage),
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
                    'بطيخ',
                    style: Styles.font13Bold,
                  ),
                  SvgPicture.asset(Assets.imagesTrash),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '3 كيلو',
                style: Styles.font13Regular
                    .copyWith(color: AppColors.deepGoldenYellow),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CartItemActionButtons(),
                  Text(
                    '30 جنية',
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
  }
}
