import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/core/repos/products_repo/products_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepo productsRepo;
  HomeCubit(this.productsRepo) : super(HomeInitial());


  Future<void> getBestSellingProducts() async {
    emit(HomeLoading());
    final result = await productsRepo.getBestSellingProducts();

    result.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (products) => emit(HomeSuccess(products: products)),
    );
  }

}
