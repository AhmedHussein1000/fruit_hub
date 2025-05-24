
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/functions/is_arabic.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/shop_now_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.sizeOf(context).width - 16;
    return SizedBox(
      width: itemWidth,
      child: Stack(
        children: [
          PositionedDirectional(
              start: itemWidth * 0.4,
              top: 0,
              bottom: 0,
              child: SvgPicture.asset(Assets.imagesOnboardingItem2Image,
                  fit: BoxFit.fill)),
          Container(
            width: itemWidth * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image:isArabic()? const svg_provider.Svg(
                 
                       Assets.imagesFeaturedItemOfferBackground
                      ,
                ): const AssetImage(Assets.imagesFeaturedItemBackgroundRotated) ,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Opacity(
                      opacity: 0.8,
                      child: Text(
                        S.of(context).eidOffers,
                        style: Styles.font13Regular.copyWith(
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    S.of(context).discount25,
                    style: Styles.font19Bold.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  ShopNowButton(
                    onPressed: () {
                      //TODO later
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
