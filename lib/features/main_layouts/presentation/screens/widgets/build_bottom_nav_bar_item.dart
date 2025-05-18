import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/features/main_layouts/domain/entities/bottom_nav_bar_item_entity.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentBottomNavBarItem buildBottomNavBarItem({
  required BottomNavBarItemEntity bottomNavBarItemEntity,
}) {
  return PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(
        bottomNavBarItemEntity.inActiveImageSvg,
        height: 20,
        width: 20,
        colorFilter:
            const ColorFilter.mode(AppColors.darkGray, BlendMode.srcIn),
      ),
      icon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5),
        child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.darkGreenPrimaryColor),
            child: Center(
                child:
                    SvgPicture.asset(bottomNavBarItemEntity.activeImageSvg))),
      ),
      title: bottomNavBarItemEntity.title,
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      activeColorPrimary: AppColors.lightGray,
      activeColorSecondary: AppColors.darkGreenPrimaryColor);
}
