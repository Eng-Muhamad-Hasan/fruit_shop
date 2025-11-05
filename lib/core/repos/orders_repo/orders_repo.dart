import 'package:dartz/dartz.dart';
import 'package:fruit_shop/Feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
  Future<Either<Failure,void>> updateProductsSellingCount(List<CartItemEntity> items);
}
