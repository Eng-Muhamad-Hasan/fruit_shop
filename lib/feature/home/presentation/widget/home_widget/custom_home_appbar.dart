import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/functions/fetch_user_data.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileAvatar, fit: BoxFit.contain),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.bodyBaseRegular16.copyWith(
          color: AppColors.gray400,
        ),
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: AppTextStyles.bodyBaseBold16.copyWith(color: AppColors.gray950),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Container(
          width: 34,
          decoration: const ShapeDecoration(
            color: AppColors.green1_50,
            shape: CircleBorder(),
          ),
          child: SvgPicture.asset(Assets.imagesNotificationIcon),
        ),
      ),
    );
  }
}
