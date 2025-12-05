import 'package:fruit_shop/Feature/checkout/data/model/order_product_model.dart';

import '../../domain/entity/order_entity.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final String uid;
  final double totalPrice;
  final ShippingAddressModel shippingAddresses;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  OrderModel({
    required this.uid,
    required this.totalPrice,
    required this.shippingAddresses,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromOrderEntity({required OrderEntity orderEntity}) {
    return OrderModel(
      uid: orderEntity.uid,
      totalPrice: orderEntity.payWithCash!
          ? orderEntity.cartEntity.getTotalCartPrice(deliveryCost: 2).toDouble()
          : orderEntity.cartEntity
                .getTotalCartPrice(deliveryCost: 0)
                .toDouble(),
      shippingAddresses: ShippingAddressModel.fromShippingAddressEntity(
        shippingAddressEntity: orderEntity.shippingAddress,
      ),
      orderProducts: orderEntity.cartEntity.cartItems
          .map(
            (cartItem) =>
                OrderProductModel.fromCartItemEntity(cartItemEntity: cartItem),
          )
          .toList(),
      paymentMethod: orderEntity.payWithCash == true ? 'cash' : 'online',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "totalPrice": totalPrice,
      "shippingAddresses": shippingAddresses.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
      "status": "pending",
      "date": DateTime.now().toLocal().toString(),
    };
  }
}
