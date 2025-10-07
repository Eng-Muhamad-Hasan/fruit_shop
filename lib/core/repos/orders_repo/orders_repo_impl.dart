import 'package:dartz/dartz.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_shop/core/services/database_service.dart';
import 'package:fruit_shop/core/utils/backend_endpoints.dart';
import 'package:fruit_shop/feature/checkout/data/model/order_model.dart';
import 'package:fruit_shop/feature/checkout/domain/entity/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;
  OrdersRepoImpl(this.fireStoreService);

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await fireStoreService.addData(
        path: BackendEndpoints.addOrders,
        data: OrderModel.fromOrderEntity(orderEntity: orderEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }
}
