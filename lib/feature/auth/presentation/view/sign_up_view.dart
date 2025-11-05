import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:fruit_shop/core/services/get_it_service.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/Feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_shop/Feature/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:fruit_shop/Feature/auth/presentation/widget/sign_up_view_body_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = "sign_up_view";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: "حساب جديد"),
        body: const SafeArea(child: SignUpViewBodyConsumer()),
      ),
    );
  }
}
