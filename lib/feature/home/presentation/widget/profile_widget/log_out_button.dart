import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/generated/l10n.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({super.key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 65),
        decoration: const BoxDecoration(
          color: AppColors.green1_50 /* Green1-50 */,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).profile_log_out_button,
              style: AppTextStyles.bodySemiBold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SvgPicture.asset(Assets.imagesLogOut),
          ],
        ),
      ),
    );
  }
}
