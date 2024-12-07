import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/fruit_products_grid_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

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
      body: Padding(
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
              const FruitProductsGridView(
                isSliver: true,
              ),
            ],
          )),
    );
  }
}
