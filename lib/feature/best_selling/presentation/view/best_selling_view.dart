import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = "best_selling_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBestSellingViewAppBar(context, title: "الأكثر مبيعاً"),
    );
  }
}

AppBar buildBestSellingViewAppBar(
  BuildContext context, {
  required String title,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    titleTextStyle: AppTextStyles.bodyLargeBold19.copyWith(
      color: AppColors.gray950,
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    actions: [
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
