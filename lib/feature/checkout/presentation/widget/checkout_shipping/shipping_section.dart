import 'package:flutter/material.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';
import 'package:fruit_shop/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection>  createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  final ValueNotifier<int> _activeIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ValueListenableBuilder<int>(
      valueListenable: _activeIndex,
      builder: (context, value, _) => Column(
        children: [
          ShippingItem(
            onTap: () {
              _activeIndex.value = 1;
              context.read<OrderEntity>().payWithCash = true;
            },
            isActive: value == 1,
            shippingTitle: S.of(context).checkout_shipping_with_cash,
            shippingSubtitle:
                '${S.of(context).checkout_shipping_with_cash_subtitle}\$',
            shippingPrice:
                '${context.read<OrderEntity>().cartEntity.getTotalCartPrice(deliveryCost: 2)} ${S.of(context).dollar}',
          ),
          const SizedBox(height: 16),
          ShippingItem(
            onTap: () {
              _activeIndex.value = 2;
              context.read<OrderEntity>().payWithCash = false;
            },
            isActive: value == 2,
            shippingTitle: S.of(context).checkout_shipping_online,
            shippingSubtitle: S.of(context).checkout_shipping_online_subtitle,
            shippingPrice:
                '${context.read<OrderEntity>().cartEntity.getTotalCartPrice()} ${S.of(context).dollar}',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
