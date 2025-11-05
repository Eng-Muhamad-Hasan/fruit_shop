import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/checkout/presentation/widget/checkout_payment/address_card.dart';


import '../../../domain/entity/order_entity.dart';
import 'payment_item.dart';
import 'payment_item_box.dart';
import 'payment_summary.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return  Column(
      spacing: 16,
      children: [
        const PaymentItemBox(
          title: 'ملخص الطلب :',
          paymentItem: PaymentItem(child: PaymentSummary()),
        ),
    
      if(context.read<OrderEntity>().payWithCash!)
        PaymentItemBox(
          title: 'عنوان التوصيل :',
          paymentItem: PaymentItem(child: AddressCard(pageController: pageController,),
          ),
        ),
    

      ],
    );
  }
}

