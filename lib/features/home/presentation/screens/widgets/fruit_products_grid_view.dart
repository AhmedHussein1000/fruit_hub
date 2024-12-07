import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_product_item.dart';

class FruitProductsGridView extends StatelessWidget {
  const FruitProductsGridView({super.key, required this.isSliver});
  final bool isSliver;
  @override
  Widget build(BuildContext context) {
    return isSliver? SliverGrid.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => const FruitProductItem(),
    ) : GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => const FruitProductItem(),
    );
  }
}
