import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity productEntity;
  final int quantity;

 const CartItemEntity({required this.productEntity, required this.quantity});

int icreaseQuantity(){
  return quantity + 1;
}
int decreaseQuantity(){
  return quantity - 1;
}
 num calculateTotalPriceforItem(){
   return productEntity.price * quantity;
 }
 num calculateTotalWeightforItem(){
   return 1 * quantity;
 }
  @override
  List<Object?> get props => [productEntity];
}
