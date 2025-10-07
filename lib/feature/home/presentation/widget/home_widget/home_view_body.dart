import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/cubit/products/products_cubit.dart';
import 'package:fruit_shop/feature/home/presentation/widget/home_widget/custom_home_appbar.dart';
import 'package:fruit_shop/feature/home/presentation/widget/home_widget/featured_items_list.dart';
import 'package:fruit_shop/feature/home/presentation/widget/home_widget/top_selling_header.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/shared/custom_search_field.dart';
import 'best_selling_grid_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
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
                CustomHomeAppBar(),
                SizedBox(height: 12),
                CustomSearchField(),
                SizedBox(height: 24),
                FeaturedItemsList(),
                SizedBox(height: 12),
                TopSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),

          BestSellingGridCubit(),
        ],
      ),
    );
  }
}

