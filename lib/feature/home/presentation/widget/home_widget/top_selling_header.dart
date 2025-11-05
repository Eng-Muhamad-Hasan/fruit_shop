import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/best_selling/presentation/view/best_selling_view.dart';
class TopSellingHeader extends StatelessWidget {
  const TopSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: AppTextStyles.bodyBaseBold16.copyWith(
            color: AppColors.gray950,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(BestSellingView.routeName),
          child: Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmallRegular13.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
      ],
    );
  }
}
