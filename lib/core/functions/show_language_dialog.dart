import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/generated/l10n.dart';

Future<String?> showLanguageDialog(BuildContext context) async {
  final selected = await showDialog<String>(
    animationStyle: const AnimationStyle(
      curve: ElasticInOutCurve(),
      duration: Duration(milliseconds: 300),
    ),
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: AppColors.green1_50,

        title: Text(S.of(context).profile_select_language),
        titleTextStyle: AppTextStyles.bodyLargeRegular19.copyWith(
          color: AppColors.gray950,
        ),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: const BorderSide(color: AppColors.orange500, width: .7),
        ),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'ar'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: Prefs.getString(kAppLanguageKey) == 'ar'
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.lightGreenAccent,
                    )
                  : null,
              child: Row(
                children: [
                  const Text('العربية'),
                  const Spacer(),
                  if (Prefs.getString(kAppLanguageKey) == 'ar')
                    SvgPicture.asset(Assets.imagesCheckBox),
                ],
              ),
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'en'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

              decoration: Prefs.getString(kAppLanguageKey) == 'en'
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.lightGreenAccent,
                    )
                  : null,
              child: Row(
                children: [
                  const Text('English'),
                  const Spacer(),
                  if (Prefs.getString(kAppLanguageKey) == 'en')
                    // Icon(Icons.check_rounded, color: Colors.red[400]),
                    SvgPicture.asset(Assets.imagesCheckBox),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
  return selected;
}
