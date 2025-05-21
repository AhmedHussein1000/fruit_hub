import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/base_products_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsRepoImpl implements BaseProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts({required S localization}) async {
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
      return  Left(ServerFailure(message:localization.get_products_failure ));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({required S localization}) async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      log('Exception in ProductsRepoImpl.getProducts: ${e.toString()}');
      return  Left(ServerFailure(message:localization.get_products_failure ));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSortedProducts(
       {required String sortOption , required S localization}) async {
    try {
      Map<String, dynamic> query = {};

      if (sortOption == 'price_asc') {
        query = {'orderBy': 'price', 'descending': false};
      } else if (sortOption == 'price_desc') {
        query = {'orderBy': 'price', 'descending': true};
      } else if (sortOption == 'alphabetical') {
        query = {'orderBy': 'name', 'descending': false};
      }

      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts,
          query: query) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      log('Exception in ProductsRepoImpl.getSortedProducts: ${e.toString()}');
      return  Left(
          ServerFailure(message: localization.get_products_failure));
    }
  }
}
