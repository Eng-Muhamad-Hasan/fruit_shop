import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/feature/on_boarding/presentation/widget/onboarding_pageview_item.dart';

class OnboardingPageview extends StatelessWidget {
  const OnboardingPageview({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        PageviewItem(
          isVisible:
             true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحبًا بك في ",
                style: AppTextStyles.heading5Bold23.copyWith(
                  color: AppColors.gray950,
                ),
              ),
              Text(
                "SHOP",
                style: AppTextStyles.heading5Bold23.copyWith(
                  color: AppColors.orange500,
                ),
              ),
              Text(
                "Fruit",
                style: AppTextStyles.heading5Bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
        ),
        PageviewItem(
          isVisible:
              false,
          title: Center(
            child: Text(
              "ابحث و تسوق",
              style: AppTextStyles.heading5Bold23.copyWith(
                color: AppColors.gray950,
              ),
            ),
          ),
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
        ),
      ],
    );
  }
}
