import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
   Future<dynamic> pushPersistentScreen(Widget screen,
      {bool withNavBar = true,
      PageTransitionAnimation animation = PageTransitionAnimation.cupertino}) {
    return PersistentNavBarNavigator.pushNewScreen(
      this,
      screen: screen,
      withNavBar: withNavBar,
      pageTransitionAnimation: animation,
    );
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}