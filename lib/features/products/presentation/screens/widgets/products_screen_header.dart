import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsScreenHeader extends StatelessWidget {
  const ProductsScreenHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        S.of(context).resultsCount(context.watch<ProductsCubit>().productsCount),
        style: Styles.font16Bold,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: AppColors.paleGray)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SvgPicture.asset(Assets.imagesFilter2),
      ),
    ]);
  }
}
