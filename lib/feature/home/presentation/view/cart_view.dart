import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/cart_item/cart_item_cubit.dart';
import 'package:fruit_shop/Feature/home/presentation/widget/cart_widget/cart_view_body.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cart_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: const CartViewBody(),
    );
  }
}
