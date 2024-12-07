import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FruitProductItem extends StatelessWidget {
  const FruitProductItem({super.key});

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
                  child: Image.asset(
                    Assets.imagesStrawberry,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      S.of(context).strawberry,
                      style: Styles.font13SemiBold,
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: S.of(context).numberOfPounds(30),
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
                        //TODO later
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
