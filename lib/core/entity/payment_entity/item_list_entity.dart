import '../../../feature/home/domain/entity/cart_item_entity.dart';
import 'items_entity.dart';

class ItemListEntity {
  List<ItemsEntity>? items;

  ItemListEntity({this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory ItemListEntity.fromCartEntity(List<CartItemEntity> cartItemEntities) {
    return ItemListEntity(items: cartItemEntities.map((e)=>ItemsEntity.fromCartItemEntity(e)).toList());
  }
}
