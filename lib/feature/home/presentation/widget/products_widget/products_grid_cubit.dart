import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/build_dummy_products.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../cubit/products_cubit/products_cubit.dart';
import '../../../../../core/shared/custom_sliver_dialog.dart';
import '../fruit_grid_view.dart';

class ProductsGridCubit extends StatelessWidget {
  const ProductsGridCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFilterFailure) {
          showLogSnackBar(context, state.message);
        }
        if (state is ProductsFilterSuccess) {
          showLogSnackBar(context, 'تمت التصفية بنجاح');
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return FruitGridView(products: state.products);
        } else if (state is ProductsFilterSuccess) {
          return FruitGridView(products: state.products);
        } else if (state is ProductsLoading || state is ProductsFilterLoading) {
          return Skeletonizer.sliver(
            child: FruitGridView(products: getDummyProducts()),
          );
        } else {
          return const CustomSliverDialog();
        }
      },
    );
  }
}
