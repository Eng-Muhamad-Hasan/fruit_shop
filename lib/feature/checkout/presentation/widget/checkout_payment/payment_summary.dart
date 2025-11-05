import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'المجموع الفرعي :',
              style: AppTextStyles.bodySmallRegular13.copyWith(
                color: AppColors.gray500,
              ),
            ),
            const Spacer(),
            Text(
              '${context.read<OrderEntity>().cartEntity.getTotalCartPrice()} دولار',
              textAlign: TextAlign.right,
              style: AppTextStyles.bodySemiBold16.copyWith(
                color: AppColors.gray500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        (context.read<OrderEntity>().payWithCash!)
            ? Row(
                children: [
                  Text(
                    'التوصيل :',
                    style: AppTextStyles.bodySmallRegular13.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '2 دولار',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodySemiBold13.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        const Divider(height: 20, color: AppColors.gray200, thickness: .5),
        Row(
          children: [
            Text(
              'الكلي',
              style: AppTextStyles.bodyBaseBold16.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const Spacer(),
            Text(
              (context.read<OrderEntity>().payWithCash!)
                  ? '${context.read<OrderEntity>().cartEntity.getTotalCartPrice(deliveryCost: 2)} دولار'
                  : '${context.read<OrderEntity>().cartEntity.getTotalCartPrice()} دولار',
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyBaseBold16.copyWith(
                color: AppColors.gray950,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
