import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:hive/hive.dart';
part 'cart_item_entity.g.dart';
@HiveType(typeId: 0)
// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  @HiveField(0)
  final ProductEntity productEntity;
 @HiveField(1)
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
