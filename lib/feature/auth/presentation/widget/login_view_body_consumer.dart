import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_progress_indicator.dart';
import 'package:fruit_shop/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/login_view_body.dart';
import 'package:fruit_shop/feature/home/presentation/view/main_view.dart';

class LoginViewBodyConsumer extends StatelessWidget {
  const LoginViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
        Navigator.of(context).pushNamedAndRemoveUntil(MainView.routeName, (route) => false);
        } else if (state is LoginFailure) {
          showLogSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          isLoading: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
