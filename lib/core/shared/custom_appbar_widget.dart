import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool exitOnRoot = false,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bodyLargeBold),
    leading: IconButton(
      onPressed: () {
        if ((Navigator.of(context).maybePop()) == false) {
          if (exitOnRoot) {
            SystemNavigator.pop();
          }
        }
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
