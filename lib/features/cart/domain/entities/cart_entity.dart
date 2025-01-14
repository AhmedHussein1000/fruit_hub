import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
  removeItemFromCart({required CartItemEntity cartItemEntity}) {
    cartItems.remove(cartItemEntity);
  }

  bool checkIfItemExistInCart({required ProductEntity productEntity}) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == productEntity.code) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == productEntity.code) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity,quantity: 1);
  }
 num calculateTotalPriceOfCart({required List<CartItemEntity> cartItems}) {
    num totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPriceforItem();
    }
    return totalPrice;
  }

}
