import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';
import 'package:fruit_shop/generated/l10n.dart';

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
            S.of(context).checkout_payment_total_subtitle,
              style: AppTextStyles.bodySmallRegular13.copyWith(
                color: AppColors.gray500,
              ),
            ),
            const Spacer(),
            Text(
              '${context.read<OrderEntity>().cartEntity.getTotalCartPrice()} ${S.of(context).dollar}',
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
                  S.of(context).checkout_payment_delivery_cost  ,
                    style: AppTextStyles.bodySmallRegular13.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '2 ${S.of(context).dollar}',
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
             S.of(context).checkout_payment_total,
              style: AppTextStyles.bodyBaseBold16.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const Spacer(),
            Text(
              (context.read<OrderEntity>().payWithCash!)
                  ? '${context.read<OrderEntity>().cartEntity.getTotalCartPrice(deliveryCost: 2)} ${S.of(context).dollar}'
                  : '${context.read<OrderEntity>().cartEntity.getTotalCartPrice()} ${S.of(context).dollar}',
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
