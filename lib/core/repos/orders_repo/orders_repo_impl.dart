import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/repos/orders_repo/base_orders_repo.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/success_order_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OrdersRepoImpl extends BaseOrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity orderEntity, required S localization}) async {
    try {
      OrderModel orderModel = OrderModel.fromEntity(order: orderEntity);
      log('order model $orderModel, json order ${orderModel.toJson()}');
      await databaseService.addData(
          path: BackendEndpoints.addOrder,
          docId: orderModel.orderId,
          data: orderModel.toJson());
      return const Right(null);
    } catch (e) {
      log('error in OrderRepoImpl.addOrder ${e.toString()}');
      return Left(ServerFailure(message: localization.add_order_failure));
    }
  }

  @override
  Stream<Either<Failure, List<SuccessOrderEntity>>> getUserOrders({required S localization}) async* {
    try {
      await for (var data in databaseService.streamData(
          path: BackendEndpoints.getOrders, userId: getCachedUser()!.userId)) {
        List<SuccessOrderEntity> orders = (data as List<dynamic>)
            .map<SuccessOrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield  Left(ServerFailure(message: localization.failed_to_get_orders));
    }
  }
}
