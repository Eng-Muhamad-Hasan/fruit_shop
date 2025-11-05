import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/cubit/products/products_cubit.dart';
import 'package:fruit_shop/Feature/home/presentation/widget/products_widget/custom_products_appbar.dart';
import 'package:fruit_shop/Feature/home/presentation/widget/products_widget/products_grid_cubit.dart';
import 'package:fruit_shop/Feature/home/presentation/widget/products_widget/products_header.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/shared/custom_search_field.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomProductsAppbar(),
                SizedBox(height: 16),
                CustomSearchField(),
                SizedBox(height: 16),

                ProductsHeader(),

                SizedBox(height: 16),
              ],
            ),
          ),

          ProductsGridCubit(),
        ],
      ),
    );
  }
}
