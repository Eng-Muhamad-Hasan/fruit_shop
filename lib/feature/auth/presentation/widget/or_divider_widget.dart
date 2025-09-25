import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 18,
      children: [
        Expanded(child: Divider(color: AppColors.gray200)),
        Text("أو", style: AppTextStyles.bodySemiBold16),
        Expanded(child: Divider(color: AppColors.gray200)),
      ],
    );
  }
}
