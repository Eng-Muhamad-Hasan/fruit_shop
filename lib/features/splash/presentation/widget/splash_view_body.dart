import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_images.dart';
import 'package:fruit_shop/features/on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     executeNavigation(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesBubbles, fit: BoxFit.fill),
      ],
    );
  }
}

void executeNavigation(BuildContext context) {
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  });
}
