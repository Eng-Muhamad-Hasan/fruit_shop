
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_progress_indicator.dart';
import 'package:fruit_shop/feature/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/sign_up_view_body.dart';

class SignUpViewBodyConsumer extends StatelessWidget {
  const SignUpViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.of(context).pop();
          showLogSnackBar(context, state.message);
        } else if (state is SignUpFailure) {
          showLogSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(isLoading: state is SignUpLoading,
        child: const SignUpViewBody());
      },
    );
  }
}
