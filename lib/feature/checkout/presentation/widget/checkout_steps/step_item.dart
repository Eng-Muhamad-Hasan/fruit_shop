import 'package:flutter/material.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_steps/active_step_item.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_steps/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  StepItem({
    super.key,
    required this.stepTitle,
    required this.stepNumber,
    required this.isActive,
  });
  final String stepTitle;
  final int stepNumber;
  final bool isActive;
  final ValueNotifier<bool> isActiveNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(stepTitle: stepTitle),
      secondChild: InactiveStepItem(
        stepNumber: stepNumber,
        stepTitle: stepTitle,
      ),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}
