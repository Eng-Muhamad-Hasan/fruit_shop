import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';

class ActiveFilterCheckBox extends StatelessWidget {
  const ActiveFilterCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: const EdgeInsets.all(2),
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
      child: SvgPicture.asset(Assets.imagesCheckBox),
    );
  }
}
