import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import 'active_radio_button.dart';
import 'inactive_radio_button.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.shippingTitle,
    required this.shippingSubtitle,
    required this.shippingPrice,
    required this.isActive,
    required this.onTap,
  });
  final String shippingTitle;
  final String shippingSubtitle;
  final String shippingPrice;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isActive ? AppColors.green1_500 : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isActive ? const ActiveRadioButton() : const InactiveRadioButton(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shippingTitle,
                  style: AppTextStyles.bodySemiBold13.copyWith(
                    color: AppColors.gray950,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  shippingSubtitle,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.bodySmallRegular13.copyWith(
                    color: Colors.black.withValues(alpha: 0.50),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              shippingPrice,
              style: AppTextStyles.bodyXSmallBold13.copyWith(
                color: AppColors.lighterPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
