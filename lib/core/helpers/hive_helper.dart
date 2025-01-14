import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveHelper {
  static const String cartBox = 'cartBox';
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ReviewEntityAdapter());
    Hive.registerAdapter(ProductEntityAdapter());
    Hive.registerAdapter(CartItemEntityAdapter());
    await Hive.openBox<CartItemEntity>(cartBox);
  }

  static void saveCartItems(
      {required List<CartItemEntity> cartItems, required String boxName}) {
    var box = Hive.box<CartItemEntity>(boxName);
    for (var cartItem in cartItems) {
      if (!box.values.contains(cartItem)) {
        box.put(cartItem.productEntity.code, cartItem);
      }
    }
  }
}
