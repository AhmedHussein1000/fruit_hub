part of 'products_cubit.dart';

sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  const GetProductsSuccess({required this.products});
}

final class GetProductsFailure extends ProductsState {
  final String message;

  const GetProductsFailure({required this.message});
}
