import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/features/checkout/data/models/paypal_payment_model/amount_model.dart';
import 'package:fruit_hub/features/checkout/data/models/paypal_payment_model/item_list_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class PaypalPaymentModel {
  final AmountModel? amount;
  final String? description;
  final ItemListModel? itemList;

  PaypalPaymentModel(
      {required this.amount,
      required this.description,
      required this.itemList});
  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
  factory PaypalPaymentModel.fromEntity(OrderEntity orderEntity) {
    return PaypalPaymentModel(
      amount: AmountModel.fromEntity(orderEntity),
      description: 'The payment transaction description.',
      itemList: ItemListModel.fromEntity(HiveHelper.getCachedCartItems()),
    );
  }
}
