import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_steps/step_item.dart';

import '../../../../../core/functions/show_log_snack_bar.dart';
import '../../../domain/entity/order_entity.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    this.currentActiveStep = 0,
    required this.pageController,
    required this.autoValidateNotifier,
  });
  final int currentActiveStep;
  final PageController pageController;
  final ValueNotifier<AutovalidateMode> autoValidateNotifier;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (currentActiveStep == 0) {
                checkoutPaymentValidate(context);
              } else if (currentActiveStep == 1) {
                checkoutAddressValidation(context, index);
              } else {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubicEmphasized,
                );
              }
            },
            child: StepItem(
              stepTitle: stepTitles[index],
              stepNumber: index + 1,
              isActive: index <= currentActiveStep,
            ),
          ),
        ),
      ),
    );
  }

  void checkoutAddressValidation(BuildContext context, int index) {
    if (autoValidateNotifier.value == AutovalidateMode.disabled) {
      showLogSnackBar(context, 'يرجى ملء جميع الحقول');
    } else if (autoValidateNotifier.value == AutovalidateMode.always) {
      showLogSnackBar(context, 'يرجى تأكيد العنوان');
    } else {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubicEmphasized,
      );
    }
  }

  void checkoutPaymentValidate(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubicEmphasized,
      );
    } else {
      showLogSnackBar(context, 'يرجى تحديد طريقة الدفع');
    }
  }
}

List<String> stepTitles = ['الشحن', 'العنوان', 'الدفع'];
