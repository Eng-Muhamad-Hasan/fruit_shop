import 'package:equatable/equatable.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  double calculateTotalprice() {
    return (productEntity.price * count);
  }

  num calculateTotalWeight() {
    return productEntity.caloriesAmountUnit * count;
  }

  void increaseCount() {
    count++;
  }

  void increaseAmount(int amount) {
    count += amount;
  }

  void setAmount(int amount) {
    count = amount;
  }

  void decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
