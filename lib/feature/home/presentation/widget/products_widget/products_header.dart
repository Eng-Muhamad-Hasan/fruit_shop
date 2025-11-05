import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/cubit/products/products_cubit.dart';
import 'package:fruit_shop/core/functions/show_filter_bottom_sheet.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import '../../../../../core/utils/app_assets.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key});
  @override
  Widget build(BuildContext context) {
    int resultCount = 0;
    return BlocConsumer<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) {
        if (current is ProductsSuccess) {
          resultCount = current.products.length;
        }
        return true;
      },
      listener: (context, state) {
        if (state is ProductsSuccess) {
          resultCount = state.products.length;
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Text(
              '$resultCount نتائج ',
              textAlign: TextAlign.right,
              style: AppTextStyles.bodyBaseBold16.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showFilterBottomSheet(context);
              },
              icon: SvgPicture.asset(Assets.imagesProductsFilter),
            ),
          ],
        );
      },
    );
  }
}
