import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/Feature/checkout/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesLocation),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            context.read<OrderEntity>().shippingAddress.fullAddress,
            textAlign: TextAlign.right,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: AppTextStyles.bodyBaseRegular16.copyWith(
              color: AppColors.gray500,
            ),
          ),
        ),
        // const Spacer(),
        const SizedBox(width: 16),
        SvgPicture.asset(Assets.imagesEdit),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () => pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubicEmphasized,
          ),
          child: Text(
            'تعديل',
            style: AppTextStyles.bodySemiBold13.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
      ],
    );
  }
}
