import 'package:fruit_shop/feature/checkout/domain/entity/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  DetailsEntity.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtotal'] = subtotal;
    data['shipping'] = shipping;
    data['shipping_discount'] = shippingDiscount;
    return data;
  }

  factory DetailsEntity.fromOrderEntity(OrderEntity orderEntity) {
    return DetailsEntity(shipping: orderEntity.shippingAddress.fullAddress,
    subtotal: orderEntity.cartEntity.getTotalCartPrice().toString(),
    shippingDiscount: orderEntity.calculateShippingDiscount()
    );
  }
}
