class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floorAndApartment;
  String? phone;

  ShippingAddressEntity(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.floorAndApartment,
      this.phone});
  String addressToString() => '$address $floorAndApartment $city';
}
