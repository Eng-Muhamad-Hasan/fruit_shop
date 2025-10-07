import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSliverDialog extends StatelessWidget {
  const CustomSliverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Dialog(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white, width: 0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,

        backgroundColor: AppColors.lighterPrimaryColor,
        child: Text(
          'خطأ في الاتصال بالخادم حاول مرة أخرى',
          style: AppTextStyles.bodyBaseRegular16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
