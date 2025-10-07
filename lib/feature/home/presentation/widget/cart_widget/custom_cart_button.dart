import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';

import '../../../../../core/shared/custom_button.dart';
import '../../../../checkout/presentation/view/checkout_view.dart';
import '../../cubit/cart/cart_cubit.dart';
import '../../cubit/cart_item/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.of(context).pushNamed(CheckoutView.routeName,arguments: context.read<CartCubit>().cartEntity);
            } else {
              showLogSnackBar(context, 'لا توجد منتجات في السلة !');
            }
          },

          textButton:
              'الدفع ${context.watch<CartCubit>().cartEntity.getTotalCartPrice()} دولار',
        );
      },
    );
  }
}
