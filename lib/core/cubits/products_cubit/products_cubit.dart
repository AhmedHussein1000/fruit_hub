import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/base_products_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final BaseProductsRepo baseProductsRepo;
  ProductsCubit(this.baseProductsRepo) : super(ProductsInitial());

  List<ProductEntity> bestSellingProducts = [];
  int productsCount = 0;
  String? currentSortOption;
  Future<void> getBestSellingProducts({required S localization}) async {
    emit(GetProductsLoading());
    final result = await baseProductsRepo.getBestSellingProducts(
        localization: localization);
    result.fold((failure) => emit(GetProductsFailure(message: failure.message)),
        (products) {
      bestSellingProducts = products;
      emit(GetProductsSuccess(products: products));
    });
  }

  Future<void> getProducts({required S localization}) async {
    emit(GetProductsLoading());
    final result =
        await baseProductsRepo.getProducts(localization: localization);
    result.fold(
      (failure) => emit(GetProductsFailure(message: failure.message)),
      (products) {
        productsCount = products.length;
        emit(GetProductsSuccess(products: products));
      },
    );
  }

  Future<void> sortProducts(
      {required S localization, required String sortOption}) async {
    currentSortOption = sortOption;
    emit(GetProductsLoading());
    final result = await baseProductsRepo.getSortedProducts(
        localization: localization, sortOption: sortOption);
    result.fold(
      (failure) => emit(GetProductsFailure(message: failure.message)),
      (products) {
        productsCount = products.length;
        emit(GetProductsSuccess(products: products));
      },
    );
  }
}
