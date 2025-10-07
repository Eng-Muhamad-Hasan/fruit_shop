import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/feature/home/presentation/cubit/cart_item/cart_item_cubit.dart';
import 'package:fruit_shop/feature/home/presentation/widget/cart_widget/cart_order_counter.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../cubit/cart/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdate) {
          if (current.cartItem == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        cartItemEntity.productEntity.imageUrl!,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppTextStyles.bodyXSmallBold13.copyWith(
                            color: AppColors.gray950,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} كغ',
                      textAlign: TextAlign.right,
                      style: AppTextStyles.bodySmallRegular13.copyWith(
                        color: AppColors.orange500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CartOrderCounter(cartItemEntity: cartItemEntity),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().removeProduct(cartItemEntity);
                    },
                    child: SvgPicture.asset(Assets.imagesTrash),
                  ),
                  const Spacer(),
                  Text(
                    '${cartItemEntity.calculateTotalprice()} دولار',
                    style: AppTextStyles.bodyBaseBold16.copyWith(
                      color: AppColors.orange500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
