import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import 'package:fruit_hub/features/best_selling_fruit/presentation/screens/widgets/best_selling_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key, this.products});
final List<ProductEntity>? products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingBackButton(),
        title: Text(S.of(context).bestSelling),
        actions: const [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16),
            child: NotificationWidget(),
          )
        ],
      ),
      body: BestSellingBody(products: products??[],),
    );
  }
}
