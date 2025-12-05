import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/custom_text_form_field.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';
import 'package:fruit_shop/generated/l10n.dart';
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
  State<AddressSection>  createState() => _AddressSectionState();
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
                  hintText: S.of(context).checkout_address_field_name,
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.email = value;
                  },
                  hintText: S.of(context).checkout_address_field_email,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.city = value;
                  },
                  hintText: S.of(context).checkout_address_field_city,
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.address = value;
                  },
                  hintText: S.of(context).checkout_address_field_address,
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.addressDetails =
                        value;
                  },
                  hintText: S
                      .of(context)
                      .checkout_address_field_address_details,
                  textInputType: TextInputType.text,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderEntity>().shippingAddress.phone = value;
                  },
                  hintText: S.of(context).checkout_address_field_phone,
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
  bool get wantKeepAlive => true;
}
