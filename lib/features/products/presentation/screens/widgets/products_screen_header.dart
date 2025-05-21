import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/products/presentation/screens/widgets/filter_bottom_sheet.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsScreenHeader extends StatelessWidget {
  const ProductsScreenHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        S
            .of(context)
            .resultsCount(context.watch<ProductsCubit>().productsCount),
        style: Styles.font16Bold,
      ),
      GestureDetector(
        onTap: () {
          final productsCubit = BlocProvider.of<ProductsCubit>(context);
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            builder: (context) => BlocProvider.value(value: productsCubit,child: const FilterBottomSheet()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: AppColors.paleGray)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ),
    ]);
  }
}
