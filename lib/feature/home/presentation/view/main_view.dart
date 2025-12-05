import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/shared/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
// import 'package:fruit_shop/feature/home/presentation/cubit/cart/cart_cubit.dart';

import '../widget/main_view_bloc_listener.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentValueIndex,
        onTap: (index) => setState(() {
          currentValueIndex = index;
        }),
      ),

      body: SafeArea(
        child: MainViewBlocListener(currentValueIndex: currentValueIndex),
      ),
    );
  }
}
