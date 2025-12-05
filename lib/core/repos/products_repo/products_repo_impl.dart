import 'package:dartz/dartz.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/core/errors/failures.dart';
import 'package:fruit_shop/core/repos/products_repo/products_repo.dart';
import 'package:fruit_shop/core/services/database_service.dart';

import '../../model/product_model.dart';
import '../../utils/backend_endpoints.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      final data =
          await databaseService.getData(
                path: BackendEndpoints.getProducts,
                documentId: null,
                query: {
                  "orderBy": "sellingCount",
                  "descending": true,
                  "limit": 4,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final data =
          await databaseService.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getAlphabetFilterProducts() async {
    try {
      final data =
          await databaseService.getData(
                path: BackendEndpoints.getProducts,
                documentId: null,
                query: {"orderBy": "name"},
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getAscendingPriceFilterProducts() async {
    try {
      final data =
          await databaseService.getData(
                path: BackendEndpoints.getProducts,
                documentId: null,
                query: {"orderBy": "price", "descending": false},
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getDescendingPriceFilterProducts() async {
    try {
      final data =
          await databaseService.getData(
                path: BackendEndpoints.getProducts,
                documentId: null,
                query: {"orderBy": "price", "descending": true},
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('خطأ في الاتصال بالخادم حاول مرة أخرى'));
    }
  }
}
