import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entity/product_entity.dart';
import '../../../../../core/repos/products_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();

    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();

    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getAlphabetFilterProducts() async {
    emit(ProductsFilterLoading());
    final result = await productsRepo.getAlphabetFilterProducts();

    result.fold(
      (failure) => emit(ProductsFilterFailure(message: failure.message)),
      (products) => emit(ProductsFilterSuccess(products: products)),
    );
  }

  Future<void> getAscendingPriceFilterProducts() async {
      emit(ProductsFilterLoading());
    final result = await productsRepo.getAscendingPriceFilterProducts();

    result.fold(
      (failure) => emit(ProductsFilterFailure(message: failure.message)),
      (products) => emit(ProductsFilterSuccess(products: products)),
    );
  }

  Future<void> getDescendingPriceFilterProducts() async {
      emit(ProductsFilterLoading());
    final result = await productsRepo.getDescendingPriceFilterProducts();

    result.fold(
      (failure) => emit(ProductsFilterFailure(message: failure.message)),
      (products) => emit(ProductsFilterSuccess(products: products)),
    );
  }
}
