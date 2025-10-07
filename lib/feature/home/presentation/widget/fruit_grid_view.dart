import 'package:flutter/material.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/feature/home/presentation/widget/fruit_item.dart';

class FruitGridView extends StatelessWidget {
  const FruitGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FruitItem(product: products[index],);
      },
    );
  }
}
