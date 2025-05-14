import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/base_products_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';

class ProductsRepoImpl implements BaseProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getBestSellingProducts,
          query: {
            'orderBy': 'sellingCount',
            'descending': true,
            'limit': 10
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      log('Exception in ProductsRepoImpl.getBestSellingProducts: ${e.toString()}');
      return const Left(ServerFailure(message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
  try {
  var data = await databaseService.getData(path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
       List<ProductEntity> products = data.map((e) => ProductModel.fromJson(e).toEntity()).toList(); 
       return Right(products);
}  catch (e) {
  log('Exception in ProductsRepoImpl.getProducts: ${e.toString()}');
  return const Left(ServerFailure(message: 'Failed to get products'));
}
  }
}
