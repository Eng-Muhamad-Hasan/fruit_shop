import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/functions/show_log_snack_bar.dart';
import '../../../../../core/shared/custom_button.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entity/cart_item_entity.dart';
import '../../cubit/cart/cart_cubit.dart';
import 'product_details_card.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.valueNotifier,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;
  final ValueNotifier<int> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.heightOf(context) * .45,
            decoration: BoxDecoration(
              color: AppColors.green1_50,
              // color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                  MediaQuery.widthOf(context) * .5,
                  MediaQuery.widthOf(context) * .3,
                ),
                bottomRight: Radius.elliptical(
                  MediaQuery.widthOf(context) * .5,
                  MediaQuery.widthOf(context) * .3,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: CachedNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Positioned(
                  top: 26,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: .7),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppTextStyles.bodyBaseBold16.copyWith(
                            color: AppColors.gray950,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${cartItemEntity.productEntity.price} دولار ',
                                style: AppTextStyles.bodyXSmallBold13.copyWith(
                                  color: AppColors.orange500,
                                ),
                              ),
                              TextSpan(
                                text: '/',
                                style: AppTextStyles.bodyXSmallBold13.copyWith(
                                  color: AppColors.orange300,
                                ),
                              ),

                              TextSpan(
                                text: ' الكيلو',
                                style: AppTextStyles.bodySemiBold13.copyWith(
                                  color: AppColors.orange400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        cartItemEntity.increaseCount();
                        valueNotifier.value = cartItemEntity.count;
                      },
                      child: const CircleAvatar(
                        backgroundColor:
                            AppColors.primaryColor /* Green1-500 */,
                        radius: 18,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, _) {
                        return Text(
                          '$value',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyBaseBold16.copyWith(
                            color: AppColors.green1_950,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        cartItemEntity.decreaseCount();
                        valueNotifier.value = cartItemEntity.count;
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFFF3F5F7),
                        /* Green1-500 */
                        radius: 18,
                        child: Icon(Icons.remove, color: Color(0xFF969899)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 9,
                  children: [
                    SvgPicture.asset(Assets.imagesRateStar),
                    Text(
                      '${cartItemEntity.productEntity.ratingAvg}',
                      style: AppTextStyles.bodySemiBold13.copyWith(
                        color: AppColors.gray950,
                      ),
                    ),
                    Text(
                      '(${cartItemEntity.productEntity.reviews.length}+)',
                      style: AppTextStyles.bodyXSmallBold13.copyWith(
                        color: const Color(0xFF9796A1),
                        fontFamily: 'IBM Plex Sans',
                      ),
                    ),
                    Text(
                      'المراجعة',
                      style: AppTextStyles.bodyXSmallBold13.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  cartItemEntity.productEntity.description,
                  style: AppTextStyles.bodySmallRegular13.copyWith(
                    color: const Color(0xFF969899),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    ProductDetailsCard(
                      title: 'الصلاحية',
                      subtitle:
                          '${cartItemEntity.productEntity.expirationMonths}/شهر',
                      svgImage: Assets.imagesCalendar,
                    ),
                    const ProductDetailsCard(
                      title: 'اورغانيك',
                      subtitle: '100%',
                      svgImage: Assets.imagesLotus,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    ProductDetailsCard(
                      title: ' كالوري',
                      subtitle:
                          '${cartItemEntity.productEntity.numberOfCalories}/كيلو ',
                      svgImage: Assets.imagesFlame,
                    ),
                    ProductDetailsCard(
                      title: 'مراجعات',
                      subtitle:
                          '${cartItemEntity.productEntity.reviews.length} ',
                      svgImage: Assets.imagesReviewStar,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  onPressed: () {
                    if (cartItemEntity.count > 0) {
                      context.read<CartCubit>().addProductWithCount(
                        cartItemEntity.productEntity,
                        cartItemEntity.count,
                      );
                      Navigator.pop(context);
                    } else {
                      showLogSnackBar(
                        context,
                        'الرجاء اختيار كمية أكبر من الصفر',
                      );
                    }
                  },
                  textButton: 'أضف إلى السلة',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
