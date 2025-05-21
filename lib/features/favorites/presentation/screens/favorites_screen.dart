import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/fruit_product_item.dart';
import 'package:fruit_hub/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingBackButton(),
        title: Text(S.of(context).favorites),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesNoFavoritesYet,
                    height: 200,
                    width: 200,
                  ),
                  Center(
                    child: Text(
                      S.of(context).no_favorites_yet,
                      style: Styles.font16SemiBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 214,
                mainAxisSpacing: 8,
                crossAxisSpacing: 16,
              ),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) => FruitProductItem(
                productEntity: state.favorites[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
