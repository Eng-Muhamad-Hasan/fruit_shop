import 'package:dartz/dartz.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
