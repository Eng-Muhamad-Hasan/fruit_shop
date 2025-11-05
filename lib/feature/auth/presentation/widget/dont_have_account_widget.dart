import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/auth/presentation/view/sign_up_view.dart';

class DontHavaAccountWidget extends StatelessWidget {
  const DontHavaAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: " لا تمتلك حساب؟ ",
            style: AppTextStyles.bodySemiBold16.copyWith(
              color: AppColors.gray400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
            text: "قم بإنشاء حساب",
            style: AppTextStyles.bodySemiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
