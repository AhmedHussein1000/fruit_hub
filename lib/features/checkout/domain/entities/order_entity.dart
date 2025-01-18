import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  num shippingCost = 30;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
      {required this.uId,
      required this.cartEntity,
      required this.shippingAddressEntity,
      this.payWithCash});

      num shippingCostCalculator(){
        if (payWithCash == true) {
          return shippingCost;
        }else{
          return 0;
        }
      }
  num calculateTotalPrice({required List<CartItemEntity> cartItems}) {
    if (payWithCash == true) {
      return cartEntity.calculateTotalPriceOfCart(
              cartItems: cartItems) +
          shippingCost;
    }else{
 return cartEntity.calculateTotalPriceOfCart(
        cartItems: cartItems);
    }
   
  }
}
