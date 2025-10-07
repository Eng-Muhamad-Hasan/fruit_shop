import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_assets.dart';

class CustomProductsAppbar extends StatelessWidget {
  const CustomProductsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          'المنتجات',
          style: AppTextStyles.bodyLargeBold19.copyWith(
            color: AppColors.gray950,
          ),
        ),
        const Spacer(),
        IconButton(
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
      ],
    );
  }
}
