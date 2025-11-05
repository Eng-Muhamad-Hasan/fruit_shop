import 'package:fruit_shop/core/entity/product_entity.dart';

import 'package:fruit_shop/Feature/home/domain/entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  void removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
  }

  bool isProductExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  num getTotalCartPrice({num deliveryCost = 0}) {
    num totalPrice = 0;
    for (CartItemEntity cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalprice();
    }
    return totalPrice + deliveryCost;
  }
}
