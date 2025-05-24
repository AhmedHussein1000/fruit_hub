import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/checkout/data/models/paypal_payment_model/item_model.dart';

class ItemListModel {
  final List<ItemModel>? items;

  ItemListModel({required this.items});

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
  factory ItemListModel.fromEntity(List<CartItemEntity> cartItems) =>
      ItemListModel(
          items: cartItems.map((e) => ItemModel.fromEntity(e)).toList());
}
