import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/base_products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final BaseProductsRepo baseProductsRepo;
  ProductsCubit(this.baseProductsRepo) : super(ProductsInitial());

  List<ProductEntity> bestSellingProducts = [];
  int productsCount = 0;
  Future<void> getBestSellingProducts() async {
    emit(GetProductsLoading());
    final result = await baseProductsRepo.getBestSellingProducts();
    result.fold((failure) => emit(GetProductsFailure(message: failure.message)),
        (products) {
      bestSellingProducts = products;
      emit(GetProductsSuccess(products: products));
    });
  }

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await baseProductsRepo.getProducts();
    result.fold(
      (failure) => emit(GetProductsFailure(message: failure.message)),
      (products) {
        productsCount = products.length;
        emit(GetProductsSuccess(products: products));
      },
    );
  }
}
