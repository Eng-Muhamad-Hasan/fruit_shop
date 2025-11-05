import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/repos/orders_repo/orders_repo.dart';

part 'order_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    emit(OrdersLoading());

    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(OrdersFailure(failure.message)), (r) async {

      final updateResult = await ordersRepo.updateProductsSellingCount(
        orderEntity.cartEntity.cartItems,
      );
      // After Order Success
      updateResult.fold(
        (failure) => emit(OrdersFailure(failure.message)),
        (r) => emit(OrdersSuccess()),
      );
    });
    return result;
  }
}
