import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  CartEntity();
  bool checkIfItemExistInCart({required ProductEntity productEntity}) {
    return HiveHelper.isProductInCart(key: productEntity.code);
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    return HiveHelper.getCachedCartItem(key: productEntity.code) ??
        CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  List<CartItemEntity> getCartItems() {
   return HiveHelper.getCachedCartItems();
  }

  num calculateTotalPriceOfCart() {
    num totalPrice = 0;
    for (var cartItem in HiveHelper.getCachedCartItems()) {
      totalPrice += cartItem.calculateTotalPriceforItem();
    }
    return totalPrice;
  }
}
