import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/products/presentation/screens/widgets/products_screen_header.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                const SearchTextField(),
                SizedBox(
                  height: 16.h,
                ),
                ProductsScreenHeader(
                  ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          const FruitProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
