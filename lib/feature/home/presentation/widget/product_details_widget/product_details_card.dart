import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgImage,
  });
  final String title;
  final String subtitle;
  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        spacing: 18,
        children: [
          Expanded(
            child: Column(
              spacing: 4,
              children: [
                FittedBox(
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodyBaseBold16.copyWith(
                      color: const Color(0xFF23AA49),
                    ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.bodySemiBold13.copyWith(
                      color: const Color(0xFF969899),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(svgImage),
        ],
      ),
    );
  }
}
