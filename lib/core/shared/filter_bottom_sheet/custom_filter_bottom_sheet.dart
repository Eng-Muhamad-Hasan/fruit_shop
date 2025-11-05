import 'package:flutter/material.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import '../custom_button.dart';
import 'custom_filter_item.dart';

class CustomFilterBottomSheetBody extends StatelessWidget {
  const CustomFilterBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 314,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 20,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 60,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF131F46),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 26),
            Text(
              'ترتيب حسب :',
              style: AppTextStyles.bodyLargeBold19.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const SizedBox(height: 14),
            const CustomFilterItem(filterText: 'الأبجدية'),
            const SizedBox(height: 16),
            const CustomFilterItem(filterText: 'السعر'),
            const SizedBox(height: 16),
            const CustomFilterItem(filterText: 'المبيعات'),
            const SizedBox(height: 25),
            CustomButton(onPressed: () {}, textButton: 'تصفية'),
          ],
        ),
      ),
    );
  }
}
