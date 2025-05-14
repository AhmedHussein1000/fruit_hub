import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseOrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity,required S localization});
}
