import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:hive/hive.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity();
  var box = Hive.box<CartItemEntity>(HiveHelper.cartBox);
  void addProductToCart({required ProductEntity productEntity}) async {
    bool isItemExist =
        cartEntity.checkIfItemExistInCart(productEntity: productEntity);
    CartItemEntity cartItem =
        cartEntity.getCartItem(productEntity: productEntity);
    if (isItemExist) {
      cartItem.icreaseQuantity();
      await box.put(productEntity.code, cartItem);
    } else {
      await box.put(cartItem.productEntity.code, cartItem);
    }

    emit(CartItemAdded());
  }

  void removeCartItem({required CartItemEntity cartItemEntity}) async {
    await box.delete(cartItemEntity.productEntity.code);

    emit(CartItemRemoved());
  }

  List<CartItemEntity> getCachedCartItems() {
    return HiveHelper.getCachedCartItems();
  }

  void deleteCartItems() {
    HiveHelper.clearCartItems();

    emit(CartCleared());
  }

  num calculateTotalPrice() {
    return cartEntity.calculateTotalPriceOfCart();
  }
}
