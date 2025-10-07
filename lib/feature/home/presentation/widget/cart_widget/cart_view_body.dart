import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/feature/home/presentation/cubit/cart/cart_cubit.dart';

import 'cart_items_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(title: 'السلة', context, backButton: false),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 91,
                      vertical: 10,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: AppColors.green1_50 /* Green1-50 */,
                    ),
                    child: Center(
                      child: Text(
                        'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
                        style: AppTextStyles.bodySmallRegular13.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                ? const SliverToBoxAdapter(
                    child: Divider(height: 22, color: Color(0xFFD8D8D8)),
                  )
                : const SliverToBoxAdapter(child: SizedBox()),
            CartItemsList(
              cartItemEntities: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                ? const SliverToBoxAdapter(
                    child: Divider(height: 80, color: Color(0xFFD8D8D8)),
                  )
                : const SliverToBoxAdapter(child: SizedBox()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom:
              //  67
              MediaQuery.of(context).size.height * .015,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}
