
import '../../../Feature/checkout/domain/entity/order_entity.dart';
import 'amount_entity.dart';
import 'item_list_entity.dart';

class PaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemListEntity? itemList;

  PaymentEntity({this.amount, this.description, this.itemList});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    data['description'] = description;
    if (itemList != null) {
      data['item_list'] = itemList!.toJson();
    }
    return data;
  }

  factory PaymentEntity.fromOrderEntity(OrderEntity orderEntity) {
    return PaymentEntity(
      amount: AmountEntity.fromOrderEntity(orderEntity),
      description: "Fruit Shop Payment",
      itemList: ItemListEntity.fromCartEntity(orderEntity.cartEntity.cartItems),
    );
  }
}





