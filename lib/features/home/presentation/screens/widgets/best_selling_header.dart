import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/screens/best_selling_screen.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Text(S.of(context).bestSelling,style: Styles.font16Bold,),
    GestureDetector(onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: const BestSellingScreen(),
        withNavBar: true, 
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    ), child: Text(S.of(context).more,style: Styles.font13Regular.copyWith(color: AppColors.mediumNeutralGray),)), 
      ],
    );
  }
}