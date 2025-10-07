part of 'order_cubit.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersFailure extends OrdersState {
  final String message;
  const OrdersFailure(this.message);

  @override
  List<Object> get props => [message];
}
final class OrdersSuccess extends OrdersState {}
