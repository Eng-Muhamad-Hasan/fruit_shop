import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/filter_bottom_sheet/active_filter_check_box.dart';
import 'package:fruit_shop/core/shared/filter_bottom_sheet/inactive_filter_check_box.dart';

class FilterCheckBox extends StatelessWidget {
  const FilterCheckBox({super.key, this.isActive = false});
  final bool isActive;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const ActiveFilterCheckBox(),
      secondChild: const InactiveFilterCheckBox(),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Durations.medium2,
    );
  }
}
