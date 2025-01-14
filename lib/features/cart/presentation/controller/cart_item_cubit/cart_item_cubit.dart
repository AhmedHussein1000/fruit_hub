import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:hive/hive.dart';
part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItem) {
    Hive.box<CartItemEntity>(HiveHelper.cartBox).put(cartItem.productEntity.code, cartItem);
    emit(CartItemUpdated(cartItemEntity: cartItem));
  }
}
