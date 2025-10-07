import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/build_dummy_products.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubit/products/products_cubit.dart';
import '../../../../../core/shared/custom_sliver_dialog.dart';
import '../fruit_grid_view.dart';

class BestSellingGridCubit extends StatelessWidget {
  const BestSellingGridCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
      
        if (state is ProductsSuccess) {
          return FruitGridView(products: state.products);
        } else if (state is ProductsLoading) {
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
