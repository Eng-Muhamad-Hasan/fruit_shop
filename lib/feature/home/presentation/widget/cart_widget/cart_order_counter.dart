import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/feature/home/presentation/cubit/cart_item/cart_item_cubit.dart';

class CartOrderCounter extends StatelessWidget {
  const CartOrderCounter({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        CartActionButton(
          icon: const Icon(Icons.add, color: Colors.white),
          fillColor: AppColors.primaryColor,
          onTap: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        Text(
          cartItemEntity.count.toString(),
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyBaseBold16.copyWith(
            color: AppColors.gray950,
          ),
        ),
        CartActionButton(
          icon: const Icon(Icons.remove, color: Color(0xFF969899)),
          fillColor: const Color(0xFFF3F5F7),
          onTap: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
      ],
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.icon,
    required this.fillColor,
    required this.onTap,
  });
  final Icon icon;
  final Color fillColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: fillColor /* Green1-500 */,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: icon,
      ),
    );
  }
}
