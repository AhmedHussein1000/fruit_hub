import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/search/domain/repository/base_search_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SearchRepoImpl implements BaseSearchRepo {
  final DatabaseService databaseService;

  SearchRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
      {required String query, required S localization}) async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> allProducts =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      final filteredProducts = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return Right(filteredProducts);
    } catch (e) {
      log('Exception in SearchRepoImpl.searchProducts: ${e.toString()}');
      return Left(ServerFailure(message: localization.search_products_failure));
    }
  }
}
