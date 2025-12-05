import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:fruit_shop/Feature/home/presentation/view/product_details_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_assets.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments: CartItemEntity(productEntity: product)
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesFavoriteHeart),
              ),
            ),
            Positioned.fill(
              bottom: 0,
              left: 0,
              top: 20,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Use available constraints to build a responsive layout
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Let the image expand to fill most of the available space
                      Expanded(
                        flex: 3,
                        child: product.imageUrl == null
                            ? Skeleton.leaf(
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.formBorderColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: product.imageUrl!,
                                placeholder: (context, url) => Skeleton.leaf(
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColors.formBorderColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                fit: BoxFit.contain,
                                width: double.infinity,
                              ),
                      ),
                      const SizedBox(height: 8),
                      // Use a denser ListTile so it adapts to small widths without overflow
                      Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          isThreeLine: false,
                          title: Text(
                            product.name,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.bodySemiBold13.copyWith(
                              color: AppColors.gray950,
                            ),
                          ),
                          subtitle: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${product.price}دولار  ',
                                  style: AppTextStyles.bodyXSmallBold13
                                      .copyWith(color: AppColors.orange500),
                                ),
                                TextSpan(
                                  text: '/',
                                  style: AppTextStyles.bodyXSmallBold13
                                      .copyWith(color: AppColors.orange300),
                                ),
                                TextSpan(
                                  text: ' الكيلو',
                                  style: AppTextStyles.bodySemiBold13.copyWith(
                                    color: AppColors.orange300,
                                  ),
                                ),
                              ],
                            ),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                          ),
                          trailing: GestureDetector(
                            onTap: () =>
                                context.read<CartCubit>().addProduct(product),
                            child: CircleAvatar(
                              backgroundColor: AppColors.green1_500,
                              radius: (constraints.maxWidth < 160) ? 14 : 18,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
