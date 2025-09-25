import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Text(
        textAlign: TextAlign.end,
        "هل نسيت كلمة المرور؟",
        style: AppTextStyles.bodySemiBold13.copyWith(
          color: AppColors.lighterPrimaryColor,
        ),
      ),
    );
  }
}
