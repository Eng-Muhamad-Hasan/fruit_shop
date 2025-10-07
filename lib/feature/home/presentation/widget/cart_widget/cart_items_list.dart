import 'package:flutter/material.dart';
import 'package:fruit_shop/feature/home/presentation/widget/cart_widget/cart_item.dart';

import '../../../../../core/constants/constants.dart';
import '../../../domain/entity/cart_item_entity.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItemEntities});
  final List<CartItemEntity> cartItemEntities;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItemEntities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
          child: CartItem(cartItemEntity: cartItemEntities[index]),
        );
      },
      separatorBuilder: (context, index) =>
          const Divider(height: 22, color: Color(0xFFD8D8D8)),
    );
  }
}
