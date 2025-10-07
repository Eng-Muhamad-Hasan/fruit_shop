import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../domain/entity/order_entity.dart';

part 'order_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    emit(OrdersLoading());
    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(OrdersFailure(failure.message)), (_)=>
      emit(OrdersSuccess())
   );
    return result;
  }
}
