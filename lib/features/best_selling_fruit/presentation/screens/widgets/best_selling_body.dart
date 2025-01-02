
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({
    super.key, required this.products,
  });
final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    S.of(context).bestSelling,
                    style: Styles.font16Bold,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
             FruitProductsGridView(products: products,),
          ],
        ));
  }
}
