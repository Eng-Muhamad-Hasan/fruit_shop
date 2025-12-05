import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool exitOnRoot = false,
  bool backButton = true,
}) {
  return AppBar(
    surfaceTintColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.bodyLargeBold19.copyWith(color: AppColors.gray950),
    ),
    leading: Visibility(
      visible: backButton,
      child: IconButton(
        onPressed: () async {
          final didPop = await Navigator.of(context).maybePop();
          if (!didPop) {
            if (exitOnRoot) {
              SystemNavigator.pop();
            }
          }
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
  );
}
