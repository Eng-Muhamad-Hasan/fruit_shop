import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_shop/core/entity/payment_entity/payment_entity.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

import '../../Feature/checkout/presentation/cubit/order/order_cubit.dart';

void paymentProcess(BuildContext context) {
  final orderEntity = context.read<OrderEntity>();
  final PaymentEntity paypalPaymentEntity = PaymentEntity.fromOrderEntity(
    orderEntity,
  );
  final orderCubit = context.read<OrdersCubit>();
  // log(paypalPaymentEntity.toJson().toString());
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        /// true for testing in the sandbox paypal environment or false for production paypal environment
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions: [paypalPaymentEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
         Navigator.pop(context);
          showLogSnackBar(context, 'تمت عملية الدفع بنجاح !');
          await orderCubit.addOrder(orderEntity);
        },
        onError: (error) {
          // log("onError: $error");
          Navigator.pop(context);
          showLogSnackBar(context, 'حدث خطأ ما أثناء عملية الدفع');
        },
        onCancel: () {
          Navigator.pop(context);
          showLogSnackBar(context, 'تم إلغاء عملية الدفع');
        },
      ),
    ),
  );
}
