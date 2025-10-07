import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PaymentItemBox extends StatelessWidget {
  const PaymentItemBox({
    super.key,
    required this.title,
    required this.paymentItem,
  });
  final String title;
  final Widget paymentItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyXSmallBold13.copyWith(
            color: AppColors.gray950,
          ),
        ),
        paymentItem,
      ],
    );
  }
}
