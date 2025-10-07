import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/services/get_it_service.dart';
import 'package:fruit_shop/feature/home/presentation/widget/products_widget/products_view_body.dart';

import '../../../../core/cubit/products/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const String routeName = "products_view";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: const ProductsViewBody(),
    );
  }
}
