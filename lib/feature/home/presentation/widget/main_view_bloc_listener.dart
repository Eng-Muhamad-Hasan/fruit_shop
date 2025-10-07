import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_log_snack_bar.dart';
import '../cubit/cart/cart_cubit.dart';
import 'main_view_body.dart';

class MainViewBlocListener extends StatelessWidget {
  const MainViewBlocListener({super.key, required this.currentValueIndex});

  final int currentValueIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddCartProduct) {
          showLogSnackBar(context, ' تمت إضافة المنتج بنجاح');
        }
        if (state is RemoveCartProduct) {
          showLogSnackBar(context, 'تمت إزالة المنتج بنجاح');
        }
      },
      child: MainViewBody(currentValueIndex: currentValueIndex),
    );
  }
}
