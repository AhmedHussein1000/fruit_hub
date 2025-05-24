import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height, this.color, this.thickness, this.indent, this.endIndent});
  final double? height;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 22,
      color: color ?? AppColors.lighterGray,
      thickness: thickness ?? 1,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
  }
}
