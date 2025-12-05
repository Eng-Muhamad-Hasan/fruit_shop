
import '../../domain/entity/shipping_address_entity.dart';

class ShippingAddressModel {
String? name;
  String? email;
  String? city;
  String? address;
  String? phone;
  String? addressDetails;
ShippingAddressModel({
     this.name,
     this.email,
     this.city,
     this.address,
     this.phone,
     this.addressDetails,
  });

  factory ShippingAddressModel.fromShippingAddressEntity({required ShippingAddressEntity shippingAddressEntity}) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      email: shippingAddressEntity.email,
      city: shippingAddressEntity.city,
      address: shippingAddressEntity.address,
      phone: shippingAddressEntity.phone,
      addressDetails: shippingAddressEntity.addressDetails,
    );
  }

  Map<String, String?> toJson() {
    return {
      "name": name ,
      "email": email,
      "city": city ,
      "address": address ,
      "phone": phone ,
      "addressDetails": addressDetails 
    };
  }
}