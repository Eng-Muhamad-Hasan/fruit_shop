import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/on_boarding/presentation/widget/onboarding_pageview_item.dart';

enum TransitionIntensity { subtle, normal, strong }

class OnboardingPageview extends StatelessWidget {
  const OnboardingPageview({
    super.key,
    required this.pageController,
    this.intensity = TransitionIntensity.normal,
  });
  final PageController pageController;
  final TransitionIntensity intensity;

  static final _pages = [
    {
      'isVisible': true,
      'title': Row(
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
      'subTitle':
          "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسية من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
      'image': Assets.imagesPageViewItem1Image,
      'backgroundImage': Assets.imagesPageViewItem1BackgroundImage,
    },
    {
      'isVisible': false,
      'title': Center(
        child: Text(
          "ابحث و تسوق",
          style: AppTextStyles.heading5Bold23.copyWith(
            color: AppColors.gray950,
          ),
        ),
      ),
      'subTitle':
          "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
      'image': Assets.imagesPageViewItem2Image,
      'backgroundImage': Assets.imagesPageViewItem2BackgroundImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: _pages.length,
      itemBuilder: (context, index) {
        // Use AnimatedBuilder to listen to pageController.page and
        // apply a painting-only transform (translate + scale + opacity)
        // so sizes and paddings are unchanged.
        return AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double page = 0.0;
            try {
              page =
                  pageController.page ?? pageController.initialPage.toDouble();
            } catch (_) {
              page = pageController.initialPage.toDouble();
            }

            final delta = (page - index).clamp(-1.0, 1.0);

            // intensity multipliers
            final multipliers = () {
              switch (intensity) {
                case TransitionIntensity.subtle:
                  return {'opacity': 0.25, 'scale': 0.03, 'translate': 12.0};
                case TransitionIntensity.normal:
                  return {'opacity': 0.4, 'scale': 0.06, 'translate': 24.0};
                case TransitionIntensity.strong:
                  return {'opacity': 0.6, 'scale': 0.12, 'translate': 36.0};
              }
            }();

            final opacity =
                1.0 - (delta.abs() * (multipliers['opacity'] as double));
            final scale =
                1.0 - (delta.abs() * (multipliers['scale'] as double));
            final translateX = delta * (multipliers['translate'] as double);

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(translateX, 0),
                child: Transform.scale(
                  scale: scale,
                  alignment: Alignment.center,
                  child: child,
                ),
              ),
            );
          },
          child: PageviewItem(
            isVisible: _pages[index]['isVisible'] as bool,
            title: _pages[index]['title'] as Widget,
            subTitle: _pages[index]['subTitle'] as String,
            image: _pages[index]['image'] as String,
            backgroundImage: _pages[index]['backgroundImage'] as String,
          ),
        );
      },
    );
  }
}
