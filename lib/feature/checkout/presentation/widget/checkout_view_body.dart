import 'package:flutter/material.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_button.dart';
import 'package:fruit_shop/feature/checkout/domain/entity/order_entity.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_address/address_section.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_payment/payment_section.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_shipping/shipping_section.dart';
import 'package:fruit_shop/feature/checkout/presentation/widget/checkout_steps/checkout_steps.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/paypal_service.dart';
import '../cubit/order/order_cubit.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController _pageController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<int> currentActivePage = ValueNotifier<int>(0);
  ValueNotifier<AutovalidateMode> autoValidateNotifier =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      currentActivePage.value = _pageController.page!.toInt();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    currentActivePage.dispose();
    autoValidateNotifier.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Column(
        spacing: 33,
        children: [
          ValueListenableBuilder(
            valueListenable: currentActivePage,
            builder: (context, value, _) {
              return CheckoutSteps(
                currentActiveStep: value,
                pageController: _pageController,
                autoValidateNotifier: autoValidateNotifier,
              );
            },
          ),

          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: getPages().length,
              itemBuilder: (context, index) {
                return getPages()[index];
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: currentActivePage,
            builder: (context, value, _) {
              return CustomButton(
                onPressed: () {
                  if (currentActivePage.value == 0) {
                    shippingPaymentValidation(context);
                  } else if (currentActivePage.value == 1) {
                    shippingAddressValidation();
                  } else {
                    context.read<OrderEntity>().payWithCash!
                        ? context.read<OrdersCubit>().addOrder(
                            context.read<OrderEntity>(),
                          )
                        : paymentProcess(context);
                  }
                },
                textButton: getButtonTitle(currentActivePage.value),
              );
            },
          ),
        ],
      ),
    );
  }

  void shippingAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubicEmphasized,
      );
    } else {
      autoValidateNotifier.value = AutovalidateMode.always;
    }
  }

  void shippingPaymentValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubicEmphasized,
      );
    } else {
      showLogSnackBar(context, 'يرجى تحديد طريقة الدفع');
    }
  }

  List<Widget> getPages() => [
    const ShippingSection(),
    AddressSection(formKey: formKey, autovalidatNotifier: autoValidateNotifier),
    PaymentSection(pageController: _pageController),
  ];

  String getButtonTitle(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'التالي';
      case 1:
        return 'تأكيد العنوان';
      case 2:
        return context.read<OrderEntity>().payWithCash!
            ? 'تأكيد الطلب'
            : 'الدفع عبر باي-بال';

      default:
        return 'التالي';
    }
  }
}
