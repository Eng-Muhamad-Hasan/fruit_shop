import 'package:flutter/material.dart';

import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({
    super.key,
    required this.stepNumber,
    required this.stepTitle,
  });
  final int stepNumber;
  final String stepTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        CircleAvatar(
          backgroundColor: AppColors.gray50,
          radius: 10,
          child: Text(
            '$stepNumber',
            style: AppTextStyles.bodySemiBold13.copyWith(
              color: AppColors.gray950,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          stepTitle,
          style: AppTextStyles.bodyXSmallBold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
