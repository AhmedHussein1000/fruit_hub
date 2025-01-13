import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  icreaseQuantity() {
    quantity += 1;
  }

  decreaseQuantity() {
    quantity -= 1;
  }

  num calculateTotalPriceforItem() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeightforItem() {
    return 1 * quantity;
  }

  @override
  List<Object?> get props => [productEntity];
}
