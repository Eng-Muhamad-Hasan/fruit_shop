import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/products_cubit/products_cubit.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../custom_button.dart';
import 'custom_filter_item.dart';
import 'filter_bottom_sheet_header.dart';

class CustomFilterBottomSheetBody extends StatefulWidget {
  const CustomFilterBottomSheetBody({super.key});

  @override
  State<CustomFilterBottomSheetBody>  createState() =>
      _CustomFilterBottomSheetBodyState();
}

class _CustomFilterBottomSheetBodyState
    extends State<CustomFilterBottomSheetBody> {
  late ValueNotifier<int> activeFilter;

  @override
  void initState() {
    activeFilter = ValueNotifier<int>(0);
    super.initState();
  }

  @override
  void dispose() {
    activeFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 314,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 20,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: activeFilter,
          builder: (context, value, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: FilterBottomSheetHeader()),

                const SizedBox(height: 26),
                Text(
                  S.of(context).filter_sort_by,
                  style: AppTextStyles.bodyLargeBold19.copyWith(
                    color: AppColors.gray950,
                  ),
                ),
                const SizedBox(height: 14),
                CustomFilterItem(
                  filterText: S.of(context).filter_alphabet,
                  onSelect: () {
                    activeFilter.value = 1;
                  },
                  isActive: value == 1,
                ),
                const SizedBox(height: 16),
                CustomFilterItem(
                  filterText: S.of(context).filter_price_ascending,
                  onSelect: () {
                    activeFilter.value = 2;
                  },
                  isActive: value == 2,
                ),
                const SizedBox(height: 16),
                CustomFilterItem(
                  filterText: S.of(context).filter_price_descending,
                  onSelect: () {
                    activeFilter.value = 3;
                  },
                  isActive: value == 3,
                ),
                const SizedBox(height: 25),
                CustomButton(
                  onPressed: () async {
                    Navigator.of(context).pop();

                    if (value == 1) {
                      await context
                          .read<ProductsCubit>()
                          .getAlphabetFilterProducts();
                    } else if (value == 2) {
                      await context
                          .read<ProductsCubit>()
                          .getAscendingPriceFilterProducts();
                    } else if (value == 3) {
                      await context
                          .read<ProductsCubit>()
                          .getDescendingPriceFilterProducts();
                    }
                  },
                  textButton: S.of(context).filter_button,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
