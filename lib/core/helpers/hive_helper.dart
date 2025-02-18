import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String cartBox = 'cartBox';    
static  var box = Hive.box<CartItemEntity>(HiveHelper.cartBox);

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ReviewEntityAdapter());
    Hive.registerAdapter(ProductEntityAdapter());
    Hive.registerAdapter(CartItemEntityAdapter());
    await Hive.openBox<CartItemEntity>(cartBox);
  }

 static CartItemEntity? getCachedCartItem({required String key}) {
  
    return box.get(key);
  }

 static bool isProductInCart({required String key}) {
    return box.containsKey(key);
  }

static  List<CartItemEntity> getCachedCartItems() {
    return box.values.toList();
  }

 static void clearCartItems() async {
    List<CartItemEntity> cartItems = getCachedCartItems();
    for (var cartItem in cartItems) {
      await box.delete(cartItem.productEntity.code);
    }
  }
}
