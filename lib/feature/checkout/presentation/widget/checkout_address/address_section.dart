import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/custom_text_form_field.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({
    super.key,
    required this.formKey,
    required this.autovalidatNotifier,
  });
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidatNotifier;

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: widget.autovalidatNotifier,
        builder: (context, value, child) {
          return Form(
            key: widget.formKey,
            autovalidateMode: value,
            child: Column(
              spacing: 8,
              children: [
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.name = value;
                  },
                  hintText: 'الاسم الكامل',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.email = value;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.city = value;
                  },
                  hintText: 'المدينة',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.address = value;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.addressDetails =
                        value;
                  },
                  hintText: 'اسم الشارع,رقم الشقة , رقم الطابق ..',
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.phone = value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.phone,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
