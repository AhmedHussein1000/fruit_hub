import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/features/cart/presentation/screens/cart_screen.dart';
import 'package:fruit_hub/features/home/presentation/screens/home_screen.dart';
import 'package:fruit_hub/features/main_layouts/domain/entities/bottom_nav_bar_item_entity.dart';
import 'package:fruit_hub/features/main_layouts/presentation/screens/widgets/build_bottom_nav_bar_item.dart';
import 'package:fruit_hub/features/products/presentation/screens/products_screen.dart';
import 'package:fruit_hub/features/profile/presentation/screens/profile_screen.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainLayouts extends StatefulWidget {
  const MainLayouts({super.key});

  @override
  State<MainLayouts> createState() => _MainLayoutsState();
}

class _MainLayoutsState extends State<MainLayouts> {
  late final PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const screens = [
      HomeScreen(),
      ProductsScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    Color _backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: _navBarItems(localization: S.of(context)),
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 70,
      backgroundColor:_backgroundColor ,
      decoration: NavBarDecoration(
       
        colorBehindNavBar:_backgroundColor ,
         boxShadow: [
                      const BoxShadow(
                        color: AppColors.faintShadowBlack,
                        blurRadius: 7,
                        offset: Offset(0, -2),
                        spreadRadius: 0,
                      )
                    ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarItems({required S localization}) {
  return bottomNavBarItems(localization: localization)
      .map(
        (bottomNavBarItem) => buildBottomNavBarItem(
            bottomNavBarItemEntity: bottomNavBarItem),
      )
      .toList();
}

