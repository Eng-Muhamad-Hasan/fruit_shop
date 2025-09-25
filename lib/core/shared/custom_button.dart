import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.textButton,
  });
  final VoidCallback onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Text(textButton,style: AppTextStyles.bodyBaseBold.copyWith(color: Colors.white),),
      ),
    );
  }
}
