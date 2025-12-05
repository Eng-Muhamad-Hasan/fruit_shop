import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:fruit_shop/core/repos/products_repo/products_repo.dart';
import 'package:fruit_shop/core/services/get_it_service.dart';

import '../widget/home_widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<ProductsRepo>()),
      child: const HomeViewBody(),
    );
  }
}
