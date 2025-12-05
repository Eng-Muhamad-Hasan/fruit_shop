import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/profile-cubit/change_language_cubit.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/generated/l10n.dart';

class FeaturedItemWidget extends StatelessWidget {
  const FeaturedItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.sizeOf(context).width - 32;
    return SizedBox(
      width: kWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            BlocBuilder<ChangeLanguageCubit, Locale>(
              buildWhen: (previous, current) =>
                  previous.languageCode != current.languageCode,
              builder: (context, state) {
                return Positioned.directional(
                  end: 0,
                  bottom: 0,
                  top: 0,
                  start: kWidth * .4,
                  textDirection: Prefs.getString(kAppLanguageKey) == "ar"
                      ? TextDirection.rtl
                      : TextDirection.ltr,

                  child: SvgPicture.asset(
                    Assets.imagesPageViewItem1Image,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: kWidth * .5,
              decoration: const ShapeDecoration(
                color: Color(0xFF5DB957),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.directional(
                    bottomEnd: Radius.elliptical(20, 88),
                    topEnd: Radius.elliptical(20, 88),
                    topStart: Radius.circular(4),
                    bottomStart: Radius.circular(4),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'عروض العيد',
                    style: AppTextStyles.bodySmallRegular13.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'خصم 25%',
                    style: AppTextStyles.bodyLargeBold19.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),

                    child: Text(
                      S.of(context).shop_now_button,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyXSmallBold13.copyWith(
                        color: AppColors.green1_500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 29),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
