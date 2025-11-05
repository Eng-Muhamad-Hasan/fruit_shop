
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

import 'details_entity.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['currency'] = currency;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }


factory AmountEntity.fromOrderEntity(OrderEntity orderEntity) {
  return AmountEntity(
    total: orderEntity.calculateFinalPrice().toString(),
    currency: kCurrency,
    details: DetailsEntity.fromOrderEntity(orderEntity),
  );
}

}
