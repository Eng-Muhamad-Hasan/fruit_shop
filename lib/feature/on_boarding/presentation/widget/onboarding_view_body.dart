import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/shared/custom_button.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_shop/feature/on_boarding/presentation/widget/onboarding_pageview.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: OnboardingPageview(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: .5),
          ),
        ),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(kIsOnBoardingViewedKey, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              textButton: "ابدأ الان",
            ),
          ),
        ),
      ],
    );
  }
}
