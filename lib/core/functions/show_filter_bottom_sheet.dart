
import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/filter_bottom_sheet/custom_filter_bottom_sheet.dart';
void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const CustomFilterBottomSheetBody();
    },
    useSafeArea: true,
    anchorPoint: const Offset(0, 55),
    barrierLabel: 'Filter',
    elevation: 2,
    barrierColor: Colors.white.withValues(alpha: .75),
    sheetAnimationStyle: const AnimationStyle(
      curve: ElasticInOutCurve(),
      duration: Duration(milliseconds: 300),
    ),
  );
}
