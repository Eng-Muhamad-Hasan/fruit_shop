import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/filter_bottom_sheet/custom_filter_bottom_sheet.dart';

void showFilterBottomSheet(BuildContext context){
showModalBottomSheet(
    context: context,
    builder: (context) {
      return const CustomFilterBottomSheetBody();
    },
    sheetAnimationStyle: const AnimationStyle(
      curve: ElasticInOutCurve(),
      duration: Duration(milliseconds: 300),
    ),
  );

}