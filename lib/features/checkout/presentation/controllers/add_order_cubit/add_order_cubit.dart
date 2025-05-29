import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repos/orders_repo/base_orders_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final BaseOrdersRepo baseOrdersRepo;
  AddOrderCubit(this.baseOrdersRepo) : super(AddOrderInitial());
  static const int maxRetries = 3;
  Future<void> addOrder({required OrderEntity order, required S localization}) async {
    emit(AddOrderLoading());
    int attempts = 1;
    while (attempts <= maxRetries) {
      final result = await baseOrdersRepo.addOrder(
          orderEntity: order, localization: localization);
      if (result.isRight()) {
        emit(AddOrderSuccess());
        return;
      }
      attempts++;
      if (attempts > maxRetries) {
        emit(AddOrderFailure(message: localization.add_order_failure));
        return;
      }
      await Future.delayed(const Duration(seconds: 2 ));
    }
  }
}
