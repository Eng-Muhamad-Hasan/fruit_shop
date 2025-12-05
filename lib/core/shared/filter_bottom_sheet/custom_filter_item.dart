import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import 'filter_check_box.dart';

class CustomFilterItem extends StatelessWidget {
  const CustomFilterItem({
    super.key,
    required this.filterText,
    required this.onSelect,
    required this.isActive,
  });
  final String filterText;
  final VoidCallback onSelect;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.green1_50,
      onTap: onSelect,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          FilterCheckBox(isActive: isActive),
          Text(
            filterText,
            style: AppTextStyles.bodyXSmallBold13.copyWith(
              color: AppColors.gray950,
            ),
          ),
        ],
      ),
    );
  }
}
