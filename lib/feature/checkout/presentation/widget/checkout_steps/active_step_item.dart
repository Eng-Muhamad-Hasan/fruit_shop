import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.stepTitle});
  final String stepTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 11.5,
          child: SvgPicture.asset(Assets.imagesCheckBox),
        ),const SizedBox(width: 4),
        Text(
         stepTitle,
          style: AppTextStyles.bodyXSmallBold13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
