import 'package:flutter/material.dart';
import 'package:fruit_shop/Feature/on_boarding/presentation/widget/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = "onBoarding";
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnboardingViewBody()));
  }
}
