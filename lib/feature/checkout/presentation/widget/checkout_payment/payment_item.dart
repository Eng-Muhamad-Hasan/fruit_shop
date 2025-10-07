import 'package:flutter/material.dart';

import '../../../../../core/utils/app_decoration.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: AppDecoration.grayBoxDecoration,
      child: child,
    );
  }
}
