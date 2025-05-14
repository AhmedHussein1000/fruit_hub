import 'package:fruit_hub/core/functions/get_currency.dart';
import 'package:fruit_hub/features/checkout/data/models/paypal_payment_model/details_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class AmountModel {
  final String? total;
  final String? currency;
  final DetailsModel? details;

   AmountModel(
      {required this.total, required this.currency, required this.details});
  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
  factory AmountModel.fromEntity(OrderEntity orderEntity) => AmountModel(
    total: orderEntity.calculateTotalPrice().toString(),
    currency: getCurrency(),
    details: DetailsModel.fromEntity(orderEntity),
  );
}
