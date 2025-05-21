import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/size_config.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: OvalClipper(context: context),
          child: Container(
            height: SizeConfig.screenHeight * 0.5,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.lightBackground
                : AppColors.coolBlack,
          ),
        ),
        Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 167.h,
                width: 221.w,
              ),
            ))
      ],
    );
  }
}

class OvalClipper extends CustomClipper<Path> {
  final BuildContext context;

  OvalClipper({super.reclip, required this.context});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
