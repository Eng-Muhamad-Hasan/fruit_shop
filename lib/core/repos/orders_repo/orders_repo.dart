import 'package:dartz/dartz.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/feature/checkout/domain/entity/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
