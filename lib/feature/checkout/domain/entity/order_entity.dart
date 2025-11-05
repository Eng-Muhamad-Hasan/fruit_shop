import 'package:fruit_shop/Feature/home/domain/entity/cart_entity.dart';

import 'shipping_address_entity.dart';

class OrderEntity {
  final String uid;
  final CartEntity cartEntity;
  ShippingAddressEntity shippingAddress;
  bool? payWithCash;

  OrderEntity({
    this.payWithCash,
    required this.cartEntity,
    required this.shippingAddress,
    required this.uid,
  });

 

  double calculateShippingCost() {
    if (payWithCash!) {
      return 2;
    }
    return 0;
  }

  int calculateShippingDiscount() {
    return 0;
  }

  double calculateFinalPrice() {
    return (calculateShippingCost() +
        cartEntity.getTotalCartPrice().toDouble());
  }
}
