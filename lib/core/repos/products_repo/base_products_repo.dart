import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts({required S localization});

  Future<Either<Failure, List<ProductEntity>>> getProducts({required S localization});

  Future<Either<Failure, List<ProductEntity>>> getSortedProducts(
      {required String sortOption , required S localization});
}
