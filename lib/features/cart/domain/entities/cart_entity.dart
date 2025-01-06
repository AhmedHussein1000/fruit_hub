import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  const CartEntity({required this.cartItems});

  removeItemFromCart({required CartItemEntity cartItemEntity}) {
    cartItems.remove(cartItemEntity);
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        cartItem.icreaseQuantity();
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }
   addCartItem({required CartItemEntity cartItemEntity}) {
    cartItems.add(cartItemEntity);
  }
  num calculateTotalPrice() {
    num totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPriceforItem();
    }
    return totalPrice;
  }
}
