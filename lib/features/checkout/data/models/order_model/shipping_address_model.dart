import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floorAndApartment;
  String? phone;

  ShippingAddressModel(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.floorAndApartment,
      this.phone});
  factory ShippingAddressModel.fromEntity(
      {required ShippingAddressEntity shippingAddressEntity}) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      email: shippingAddressEntity.email,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      floorAndApartment: shippingAddressEntity.floorAndApartment,
      phone: shippingAddressEntity.phone,
    );
  }
  toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'floorAndApartment': floorAndApartment,
      'phone': phone,
    };
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      floorAndApartment: json['floorAndApartment'],
      city: json['city'],
      email: json['email'],
    );
  }
  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      city: city,
      floorAndApartment: floorAndApartment,
      phone: phone,
    );
  }
}
