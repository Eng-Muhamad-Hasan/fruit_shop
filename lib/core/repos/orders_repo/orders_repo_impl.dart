import 'package:dartz/dartz.dart';
import 'package:fruit_shop/Feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_shop/core/services/database_service.dart';
import 'package:fruit_shop/core/utils/backend_endpoints.dart';
import 'package:fruit_shop/Feature/checkout/data/model/order_model.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

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
      // await fireStoreService.updateData(path: BackendEndpoints.updateProducts);
      return const Right(null);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProductsSellingCount(
    List<CartItemEntity> items,
  ) async {
    try {
      for (var item in items) {
        // Find document id by 'code' field (products store 'code' inside the doc)
        final docId = await fireStoreService.findDocumentIdByField(
          path: BackendEndpoints.updateProducts,
          field: 'code',
          value: item.productEntity.code,
        );

        if (docId == null) {
          // If product doc not found, skip update (do not create)
          continue;
        }

        // Update using Firestore's atomic increment
        await fireStoreService.updateData(
          path: BackendEndpoints.updateProducts,
          documentId: docId,
          data: {
            'sellingCount':
                item.count, // Will be used with FieldValue.increment
            'lastUpdated': DateTime.now().toIso8601String(),
          },
        );
      }
      return right(null);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }
}
