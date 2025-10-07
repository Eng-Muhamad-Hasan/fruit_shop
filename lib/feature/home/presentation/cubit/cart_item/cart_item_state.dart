part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();


}

final class CartItemInitial extends CartItemState {}
final class CartItemUpdate extends CartItemState {
  final CartItemEntity cartItem;

  CartItemUpdate({required this.cartItem});
}