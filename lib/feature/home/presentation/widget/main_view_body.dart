import 'package:flutter/material.dart';
import 'package:fruit_shop/Feature/ai_chat/presentation/view/ai_chat_view.dart';
import 'package:fruit_shop/Feature/home/presentation/view/profile_view.dart';

import '../view/cart_view.dart';
import '../view/home_view.dart';
import '../view/products_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentValueIndex});

  final int currentValueIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentValueIndex,
      children: const [HomeView(), ProductsView(), CartView(),AiChatView(), ProfileView()],
    );
  }
}
