import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/products_cubit/products_cubit.dart';
import 'package:fruit_shop/core/functions/show_filter_bottom_sheet.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/generated/l10n.dart';

import '../../../../../core/utils/app_assets.dart';

class ProductsHeader extends StatefulWidget {
  const ProductsHeader({super.key});

  @override
  State<ProductsHeader> createState() => _ProductsHeaderState();
}

class _ProductsHeaderState extends State<ProductsHeader>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    int resultCount = 0;
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) {
        if (current is ProductsSuccess) {
          resultCount = current.products.length;
        }
        if (current is ProductsFilterSuccess) {
          resultCount = current.products.length;
        }

        return true;
      },

      builder: (context, state) {
        return Row(
          children: [
            Text(
              '$resultCount ${S.of(context).products_results} ',
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

  @override
  bool get wantKeepAlive => true;
}
