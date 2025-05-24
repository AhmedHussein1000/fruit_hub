
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({
    super.key, this.indicatorColor,
  });
final Color? indicatorColor;
  
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: indicatorColor?? AppColors.darkGreenPrimaryColor,
    ));
  }
}
