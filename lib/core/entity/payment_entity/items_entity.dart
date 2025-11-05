import 'package:fruit_shop/core/constants/constants.dart';

import '../../../Feature/home/domain/entity/cart_item_entity.dart';

class ItemsEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemsEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }

  factory ItemsEntity.fromCartItemEntity(CartItemEntity cartItemEntity) {
return ItemsEntity(
  name: cartItemEntity.productEntity.name,
  quantity: cartItemEntity.count,
  price: cartItemEntity.productEntity.price.toString(),
  currency: kCurrency,
);

  }
}
