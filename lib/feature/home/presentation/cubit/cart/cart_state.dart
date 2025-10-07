part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class AddCartProduct extends CartState {}

final class RemoveCartProduct extends CartState {}

final class CartCleared extends CartState {}
