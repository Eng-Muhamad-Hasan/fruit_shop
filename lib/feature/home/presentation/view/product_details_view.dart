import 'package:flutter/material.dart';

import 'package:fruit_shop/feature/home/domain/entity/cart_item_entity.dart';

import '../widget/product_details_widget/product_details_body.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.cartItemEntity});
  static const String routeName = 'product_details';
  final CartItemEntity cartItemEntity;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailsBody(
          cartItemEntity: widget.cartItemEntity,
          valueNotifier: valueNotifier,
        ),
      ),
    );
  }
}
