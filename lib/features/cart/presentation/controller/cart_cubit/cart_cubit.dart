import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProductToCart({required ProductEntity productEntity}) {
    bool isItemExist =
        cartEntity.checkIfItemExistInCart(productEntity: productEntity);
    CartItemEntity cartItem =
        cartEntity.getCartItem(productEntity: productEntity);
    if (isItemExist) {
      cartItem.icreaseQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void removeCartItem({required CartItemEntity cartItemEntity}) {
    cartEntity.removeItemFromCart(cartItemEntity: cartItemEntity);
    emit(CartItemRemoved());
  }
}
