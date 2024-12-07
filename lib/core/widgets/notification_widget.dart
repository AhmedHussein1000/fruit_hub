

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: const BoxDecoration(
          color: AppColors.mintWhisper, shape: BoxShape.circle),
      child: Stack(
        children: [
          Center(
              child: SvgPicture.asset(
            Assets.imagesNotification,
            height: 20,
            width: 20,
          )),
          Positioned(
            top: 7,
            right: 0,
            left: 0,
            child: Container(
              width: 4.17,
              height: 4.17,
              decoration: const BoxDecoration(
                  color: AppColors.brightRed, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
