import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.iconImage,
  });
  final String title;
  final VoidCallback onPress;
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: const BorderSide(width: 1, color: AppColors.formBorderColor),
          ),
        ),
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          title: Text(title, textAlign: TextAlign.center),
          leading: SvgPicture.asset(iconImage),
        ),
      ),
    );
  }
}
