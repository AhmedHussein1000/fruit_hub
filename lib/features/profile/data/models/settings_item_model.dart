import 'package:flutter/material.dart';

class SettingsItemModel {
  final String svgPath;
  final String title;
  final Widget? trailing;
  final void Function()? onTap;

  const SettingsItemModel({
    required this.svgPath,
    required this.title,
    this.trailing,
    this.onTap,
  });
}
