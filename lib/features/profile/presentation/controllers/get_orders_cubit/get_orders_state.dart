part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersLoading extends GetOrdersState {}

final class GetOrdersSuccess extends GetOrdersState {
  final List<SuccessOrderEntity> orders;

  GetOrdersSuccess({required this.orders});
}

final class GetOrdersFailure extends GetOrdersState {
  final String errMessage;

  GetOrdersFailure(this.errMessage);
}
