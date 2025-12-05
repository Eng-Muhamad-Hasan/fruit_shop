import 'package:flutter/widgets.dart';
import 'package:fruit_shop/Feature/home/presentation/widget/products_widget/products_view_body.dart';
class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const String routeName = "products_view";
  @override
  Widget build(BuildContext context) {
    return const ProductsViewBody();
  }
}
