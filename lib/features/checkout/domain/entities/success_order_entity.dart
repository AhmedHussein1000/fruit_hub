import 'package:fruit_hub/core/utils/enums.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_product_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class SuccessOrderEntity {
  final String uId;
  final String orderID;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final num totalPrice;
  final OrderStatusEnum status;
  SuccessOrderEntity(
      {required this.totalPrice,
      required this.uId,
      required this.orderID,
      required this.status,
      required this.shippingAddress,
      required this.orderProducts,
      required this.paymentMethod});
      
}