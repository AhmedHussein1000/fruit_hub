import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/product_details/presentation/screens/widgets/product_details_image.dart';
import 'package:fruit_hub/features/product_details/presentation/screens/widgets/product_details_info.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        ProductDetailsImage(
          imageUrl: product.imageUrl!,
        ),
        ProductDetailsInfo(product: product)
      ],
    ));
  }
}
