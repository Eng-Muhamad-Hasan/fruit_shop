import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/firebase/firebase_auth_service.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/auth/presentation/view/login_view.dart';
import 'package:fruit_shop/Feature/home/presentation/view/main_view.dart';
import 'package:fruit_shop/Feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  // Controller used to drive Lottie playback; we reuse it between assets.
  late final AnimationController _lottieController;
  int _lottieIndex = 0; // 0 -> apple, 1 -> welcome

  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _lottieController = AnimationController(vsync: this);

    // start fade in
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  Future<void> _onLottieLoaded(LottieComposition composition) async {
    // set controller duration and play
    _lottieController.duration = composition.duration;
    _lottieController.reset();
    _lottieController.forward();

    _lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // if we played the first animation, play the second
        if (_lottieIndex == 0) {
          setState(() => _lottieIndex = 1);
        } else if (!_navigated) {
          _navigated = true;
          await _navigateNext();
        }
      }
    });
  }

  Future<void> _navigateNext() async {
    final isOnBoardingViewed = Prefs.getBool(kIsOnBoardingViewedKey);
    if (!mounted) return;
    if (isOnBoardingViewed!) {
      final isLogIn = FirebaseAuthService().isLogIn();
      if (isLogIn) {
        Navigator.pushReplacementNamed(context, MainView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // centered layout with decorations at top-right and bottom
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // top-right decorative plant
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(Assets.imagesPlant, fit: BoxFit.contain),
            ),

            // center content with fade and lottie
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: RepaintBoundary(
                        child: Lottie.asset(
                          _lottieIndex == 0
                              ? Assets.lottieApple
                              : Assets.lottieWelcome,
                          controller: _lottieController,
                          onLoaded: _onLottieLoaded,
                          fit: BoxFit.contain,
                          repeat: false,
                        ),
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fruit',
                            style: AppTextStyles.heading1Regular48.copyWith(
                              color: AppColors.orange400,
                            ),
                          ),
                          TextSpan(
                            text: ' Shop',
                            style: AppTextStyles.heading1Regular48.copyWith(
                              color: AppColors.lighterPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // bottom decorative bubbles
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                Assets.imagesBubbles,
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
