class ShippingAddressEntity {
   String? name;
   String? email;
   String? city;
   String? address;
   String? phone;
   String? addressDetails;

  ShippingAddressEntity({
     this.name,
     this.email,
     this.city,
     this.address,
     this.phone,
     this.addressDetails,
  });

  String get fullAddress {
    return '$city, $address, $addressDetails';
  }
}
