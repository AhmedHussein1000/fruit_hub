import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view_loading.dart';

class FruitProductsGridViewBlocBuilder extends StatelessWidget {
  const FruitProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoading ||
          current is GetProductsSuccess ||
          current is GetProductsFailure,
      builder: (context, state) {
        log('state: $state');
        if (state is GetProductsSuccess) {
          return FruitProductsGridView(products: state.products);
        } else if (state is GetProductsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return const FruitProductsGridViewLoading();
        }
      },
    );
  }
}
