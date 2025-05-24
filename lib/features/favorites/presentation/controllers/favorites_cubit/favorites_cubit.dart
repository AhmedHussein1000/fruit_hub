import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(favorites: []));

  void toggleFavorite(ProductEntity product) {
    final currentFavorites = List<ProductEntity>.from(state.favorites);
    final wasFavorite =
        currentFavorites.any((p) => p.code == product.code);

    if (wasFavorite) {
      currentFavorites.removeWhere((p) => p.code == product.code);
    } else {
      currentFavorites.add(product);
    }

    emit(FavoritesState(favorites: currentFavorites));
  }

  bool isFavorite(ProductEntity product) {
    return state.favorites.any((p) => p.code == product.code);
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {

      final List<dynamic> favoritesJson = json['favorites'] as List<dynamic>;
      final List<ProductEntity> favorites = [];

      for (final productJson in favoritesJson) {
        favorites.add(ProductEntity(
          name: productJson['name'],
          code: productJson['code'],
          description: productJson['description'],
          price: productJson['price'],
          imageUrl: productJson['imageUrl'],
          isFeatured: productJson['isFeatured'],
          isOrganic: productJson['isOrganic'] ?? false,
          expirationMonths: productJson['expirationMonths'],
          numberOfCalories: productJson['numberOfCalories'],
          unitAmount: productJson['unitAmount'],
          reviews: [],
        ));
      }

      return FavoritesState(favorites: favorites);
    }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    
      final List<Map<String, dynamic>> favoritesJson = state.favorites
          .map((product) =>  {
                'name': product.name,
                'code': product.code,
                'description': product.description,
                'price': product.price,
                'imageUrl': product.imageUrl,
                'isFeatured': product.isFeatured,
                'isOrganic': product.isOrganic,
                'expirationMonths': product.expirationMonths,
                'numberOfCalories': product.numberOfCalories,
                'unitAmount': product.unitAmount,
              })
          .toList();
      return {'favorites': favoritesJson};
  }
}
