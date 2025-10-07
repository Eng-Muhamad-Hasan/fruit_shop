part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  const ProductsFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
final class ProductsSuccess extends ProductsState {
  const ProductsSuccess({required this.products} );
  final List<ProductEntity> products;
  @override
  List<Object> get props => [products];
}
