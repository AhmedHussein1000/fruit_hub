import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      options: CarouselOptions(
        aspectRatio: 342 / 158,
        viewportFraction: 0.912,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayInterval: const Duration(seconds: 3),
      ),
      itemBuilder: (context, index, realIndex) => const Padding(
        padding: EdgeInsetsDirectional.only(end: 8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: FeaturedItem()),
      ),
    );
  }
}
