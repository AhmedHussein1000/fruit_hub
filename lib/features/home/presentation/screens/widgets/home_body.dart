import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/core/widgets/search_text_field.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/featured_list.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/home_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding.w),
                child: const HomeAppbar(),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding.w),
                child: const SearchTextField(),
              ),
              SizedBox(
                height: 12.h,
              ),
              const FeaturedList(),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding.w),
                child:  const BestSellingHeader(),
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver:  const FruitProductsGridViewBlocBuilder()),
      ],
    );
  }
}
