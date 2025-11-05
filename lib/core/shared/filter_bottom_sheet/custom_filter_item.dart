import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import 'filter_check_box.dart';

class CustomFilterItem extends StatelessWidget {
  const CustomFilterItem({super.key, required this.filterText});
  final String filterText;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        const FilterCheckBox(),
        Text(
          filterText,
          style: AppTextStyles.bodyXSmallBold13.copyWith(
            color: AppColors.gray950,
          ),
        ),
      ],
    );
  }
}
