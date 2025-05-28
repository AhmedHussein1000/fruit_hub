import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.code,
      required this.imageUrl,
      required this.price,
      required this.quantity});
  factory OrderProductModel.fromEntity({required CartItemEntity cartItem}) {
    return OrderProductModel(
        name: cartItem.productEntity.name,
        code: cartItem.productEntity.code,
        imageUrl: cartItem.productEntity.imageUrl!,
        price: cartItem.productEntity.price,
        quantity: cartItem.quantity);
  }
  toJson() {
    return {
      'name':name,
      'code':code,
      'imageUrl':imageUrl,
      'price':price,
      'quantity':quantity
    };
  }
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
  OrderProductEntity toEntity(){
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}
