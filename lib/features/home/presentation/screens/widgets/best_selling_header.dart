import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/navigation_extension.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Text(S.of(context).bestSelling,style: Styles.font16Bold,),
    GestureDetector(onTap: () => context.pushNamed(Routes.bestSelling), child: Text(S.of(context).more,style: Styles.font13Regular.copyWith(color: AppColors.mediumNeutralGray),)), 
      ],
    );
  }
}