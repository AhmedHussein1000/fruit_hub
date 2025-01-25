import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class DetailsModel {
  final String? subtotal;
  final String? shipping;
  final double? shippingDiscount;

   DetailsModel(
      {required this.subtotal,
      required this.shipping,
      required this.shippingDiscount});
  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
   
  factory DetailsModel.fromEntity(OrderEntity orderEntity) => DetailsModel(
      subtotal: orderEntity.cartEntity.calculateTotalPriceOfCart().toString(),
      shipping: orderEntity.shippingCostCalculator().toString(),
      shippingDiscount: orderEntity.calculateShippingDiscount());
}
