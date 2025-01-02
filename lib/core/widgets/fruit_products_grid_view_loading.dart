import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_dummy_data.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FruitProductsGridViewLoading extends StatelessWidget {
  const FruitProductsGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
        child:
            FruitProductsGridView(products: GetDummyData.getDummyProducts()));
  }
}
