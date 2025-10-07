import 'package:flutter/material.dart';
import 'package:fruit_shop/feature/home/presentation/widget/home_widget/featured_item_widget.dart';

class FeaturedItemsList extends StatelessWidget {
  const FeaturedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [...List.generate(3, (index) => const FeaturedItemWidget())],
      ),
    );
  }
}
