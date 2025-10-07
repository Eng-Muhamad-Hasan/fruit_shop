import 'package:flutter/material.dart';
import 'package:fruit_shop/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_shop/feature/auth/presentation/view/sign_up_view.dart';
import 'package:fruit_shop/feature/best_selling/presentation/view/best_selling_view.dart';
import 'package:fruit_shop/feature/checkout/presentation/view/checkout_view.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_entity.dart';
import 'package:fruit_shop/feature/home/domain/entity/cart_item_entity.dart';
import 'package:fruit_shop/feature/home/presentation/view/cart_view.dart';
import 'package:fruit_shop/feature/home/presentation/view/main_view.dart';
import 'package:fruit_shop/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_shop/feature/splash/presentation/view/splash_view.dart';

import '../../feature/home/presentation/view/product_details_view.dart';
import '../../feature/home/presentation/view/products_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
      case ProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductsView());
      case ProductDetailsView.routeName:
      return MaterialPageRoute(builder: (context) =>  ProductDetailsView(cartItemEntity: settings.arguments as CartItemEntity));
      case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
      case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) =>  CheckoutView(cartEntity: settings.arguments as CartEntity));
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
