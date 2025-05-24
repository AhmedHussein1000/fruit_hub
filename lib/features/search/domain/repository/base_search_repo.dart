import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseSearchRepo {
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String query,required S localization});
}
