import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BottomNavBarItemEntity {
  final String title;
  final String inActiveImageSvg;
  final String activeImageSvg;
  BottomNavBarItemEntity({required this.title,required this.inActiveImageSvg,required this.activeImageSvg});
}

 List<BottomNavBarItemEntity> bottomNavBarItems({required S localization}) => [
   BottomNavBarItemEntity(
     title:  localization.home,
     inActiveImageSvg: Assets.imagesSvgsOutlinedNavbarIconsHome,
     activeImageSvg: Assets.imagesSvgsBoldNavbarIconsHome,
   ),
   BottomNavBarItemEntity(
     title: localization.products,
     inActiveImageSvg: Assets.imagesSvgsOutlinedNavbarIconsProducts,
     activeImageSvg: Assets.imagesSvgsBoldNavbarIconsProducts,
   ),
   BottomNavBarItemEntity(
     title: localization.shoppingCart,
     inActiveImageSvg: Assets.imagesSvgsOutlinedNavbarIconsShoppingCart,
     activeImageSvg: Assets.imagesSvgsBoldNavbarIconsShoppingCart,
   ),
   BottomNavBarItemEntity(
     title: localization.profile,
     inActiveImageSvg: Assets.imagesSvgsOutlinedNavbarIconsUser,
     activeImageSvg: Assets.imagesSvgsBoldNavbarIconsUser,
   ),
 ];