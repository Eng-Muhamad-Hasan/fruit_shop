import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/fetch_user_data.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/core/shared/custom_progress_indicator.dart';
import 'package:fruit_shop/feature/checkout/domain/entity/order_entity.dart';
import 'package:fruit_shop/feature/checkout/domain/entity/shipping_address_entity.dart';
import 'package:fruit_shop/feature/checkout/presentation/cubit/order/order_cubit.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_entity.dart';
import 'package:fruit_shop/feature/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../core/repos/orders_repo/orders_repo.dart';
import '../../../../core/services/get_it_service.dart';
import '../widget/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = '/checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
      uid: getUser().uid,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن'),

        body: SafeArea(
          child: Provider.value(
            value: orderEntity,
            child: BlocConsumer<OrdersCubit, OrdersState>(
              listener: (context, state) {
                if (state is OrdersSuccess) {
                  context.read<CartCubit>().clearCart();
                  Navigator.pop(context);
                  showLogSnackBar(context, 'تم اضافة الطلب بنجاح');
                }
                if (state is OrdersFailure) {
                  showLogSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                return CustomProgressIndicator(
                  isLoading: state is OrdersLoading,
                  child: const CheckoutViewBody(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
