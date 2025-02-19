import 'package:fruit_hub/features/checkout/data/models/order_model/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/order_model/shipping_address_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String uId;
  final String orderId;
  final List<OrderProductModel> orderProducts;
  final ShippingAddressModel shippingAddressModel;
  final String paymentMethod;
  final num totalPrice;

  OrderModel(
      {required this.uId,
      required this.orderId,
      required this.orderProducts,
      required this.shippingAddressModel,
      required this.paymentMethod,
      required this.totalPrice});
  factory OrderModel.fromEntity({required OrderEntity order}) {
    return OrderModel(
        uId: order.uId,
        orderId: const Uuid().v4(),
        orderProducts: order.cartEntity.getCartItems()
            .map(
              (cartItem) => OrderProductModel.fromEntity(cartItem: cartItem),
            )
            .toList(),
        shippingAddressModel: ShippingAddressModel.fromEntity(
            shippingAddressEntity: order.shippingAddressEntity),
        paymentMethod: order.payWithCash! ? 'Cash' : 'Paypal',
        totalPrice: order.calculateTotalPrice());
  }
  toJson() {
    return {
      'uId': uId,
      'orderId': orderId,
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'status': 'pending',
      'date': DateTime.now().toString(),
    };
  }
}
