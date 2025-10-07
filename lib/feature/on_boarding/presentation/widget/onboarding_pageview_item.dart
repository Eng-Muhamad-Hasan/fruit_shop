import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/feature/auth/presentation/view/login_view.dart';

class PageviewItem extends StatelessWidget {
  const PageviewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.backgroundImage,
    required this.isVisible,
  });
  final Widget title;
  final String subTitle;
  final String image, backgroundImage;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {

                  Prefs.setBool(kIsOnBoardingViewedKey,true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "تخطي",
                      style: AppTextStyles.bodySmallRegular13.copyWith(
                        color: AppColors.gray400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySemiBold13.copyWith(
              color: AppColors.gray500,
            ),
          ),
        ),
      ],
    );
  }
}
