import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_entity.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity productEntity) {
    final cartItem = cartEntity.getCartItem(productEntity);
    bool isExist = cartEntity.isProductExist(productEntity);

    if (isExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }

    emit(AddCartProduct());
  }

  void addProductWithCount(ProductEntity productEntity, int amount) {
    final cartItem = cartEntity.getCartItem(productEntity);
    bool isExist = cartEntity.isProductExist(productEntity);

    if (isExist) {
      cartItem.increaseAmount(amount);
    } else {
      cartItem.setAmount(amount);
      cartEntity.addCartItem(cartItem);
    }

    emit(AddCartProduct());
  }

  void removeProduct(CartItemEntity cartItem) {
    cartEntity.removeCartItem(cartItem);
    emit(RemoveCartProduct());
  }

  void clearCart() {
    cartEntity.cartItems.clear();
    emit(CartCleared());
  }
}
