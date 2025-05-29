import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repos/orders_repo/base_orders_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entities/success_order_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.ordersRepo) : super(GetOrdersInitial());
  final BaseOrdersRepo ordersRepo;

  StreamSubscription? _streamSubscription;
  void getUserOrders({required S localization}) {
    emit(GetOrdersLoading());
    _streamSubscription = ordersRepo.getUserOrders(localization: localization).listen((result) {
      result.fold((f) {
        emit(GetOrdersFailure(f.message));
      }, (r) {
        emit(GetOrdersSuccess(
          orders: r,
        ));
      });
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
