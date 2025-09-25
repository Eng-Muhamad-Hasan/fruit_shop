import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: RepaintBoundary(
              child: Lottie.asset(Assets.lottieGlowLoading),
            ),
          )
        : child;
  }
}
