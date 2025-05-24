import 'package:fruit_hub/core/functions/get_currency.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class ItemModel {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  ItemModel({required this.name, required this.quantity, required this.price, required this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
  factory ItemModel.fromEntity(CartItemEntity cartItem) {
    return ItemModel(
      name: cartItem.productEntity.name,
      quantity: cartItem.quantity,
      price: cartItem.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }    

}