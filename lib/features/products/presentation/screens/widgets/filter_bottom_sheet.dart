import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final productsCubit = context.read<ProductsCubit>();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text(
                S.of(context).sortBy,
                style: Styles.font16Bold,
              ),
              const SizedBox(height: 11),
              _buildSortOption(
                context,
                title: S.of(context).priceLowToHigh,
                value: 'price_asc',
                groupValue: productsCubit.currentSortOption,
                onChanged: (value) => productsCubit.sortProducts(
                    localization: S.of(context), sortOption: value!),
              ),
              _buildSortOption(
                context,
                title: S.of(context).priceHighToLow,
                value: 'price_desc',
                groupValue: productsCubit.currentSortOption,
                onChanged: (value) => productsCubit.sortProducts(
                    localization: S.of(context), sortOption: value!),
              ),
              _buildSortOption(
                context,
                title: S.of(context).alphabetical,
                value: 'alphabetical',
                groupValue: productsCubit.currentSortOption,
                onChanged: (value) => productsCubit.sortProducts(
                    localization: S.of(context), sortOption: value!),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () => context.pop(),
                  buttonText: S.of(context).apply,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortOption(
    BuildContext context, {
    required String title,
    required String value,
    required String? groupValue,
    required Function(String?)? onChanged,
  }) {
    return RadioListTile<String>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: AppColors.darkGreenPrimaryColor,
      contentPadding: EdgeInsets.zero,
    );
  }
}
