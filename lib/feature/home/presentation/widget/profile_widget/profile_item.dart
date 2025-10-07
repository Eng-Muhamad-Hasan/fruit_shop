import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    this.isText = false,
    this.isSwitch = false,
    required this.title,
    required this.svgIcon,
  });
  final bool isText;
  final bool isSwitch;
  final String title;
  final String svgIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 7,
          children: [
            SvgPicture.asset(svgIcon),
            Text(
              title,
              style: AppTextStyles.bodySemiBold13.copyWith(
                color: AppColors.gray400,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: isText,

              child: const Text(
                'العربية',
                style: TextStyle(
                  color: Color(0xFF0C0D0D) /* Grayscale-950 */,
                  fontSize: 13,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  height: 1.60,
                ),
              ),
            ),
            isSwitch
                ? Switch(value: true, onChanged: (value) {})
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.gray950,
                  ),
          ],
        ),
      ),
    );
  }
}
