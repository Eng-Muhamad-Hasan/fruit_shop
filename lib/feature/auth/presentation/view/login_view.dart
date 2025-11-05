import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/services/get_it_service.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/Feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_shop/Feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:fruit_shop/Feature/auth/presentation/widget/login_view_body_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل الدخول"),
        body: const SafeArea(child: LoginViewBodyConsumer()),
      ),
    );
  }
}
