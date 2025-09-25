import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/shared/custom_button.dart';
import 'package:fruit_shop/core/shared/custom_text_form_field.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/custom_password_field.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/dont_have_account_widget.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/forget_password_widget.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/or_divider_widget.dart';
import 'package:fruit_shop/feature/auth/presentation/widget/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email;
  late String password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: Form(
        key: formState,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: "البريد الالكتروني",
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomPasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16),
            const ForgetPasswordWidget(),
            const SizedBox(height: 33),
            CustomButton(
              onPressed: () {
                if (formState.currentState!.validate()) {
                  formState.currentState!.save();
                  context.read<LoginCubit>().signIn(email, password);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              textButton: "تسجيل الدخول",
            ),
            const SizedBox(height: 33),
            const DontHavaAccountWidget(),
            const SizedBox(height: 33),
            const OrDividerWidget(),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: 'تسجيل بواسطة غوغل',
              onPress: () {
                context.read<LoginCubit>().signInWithGoogle();
              },
              iconImage: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),
            if (Platform.isIOS) ...[
              SocialLoginButton(
                title: 'تسجيل بواسطة آبل',
                onPress: () {},
                iconImage: Assets.imagesAppleIcon,
              ),
              const SizedBox(height: 16),
            ],

            SocialLoginButton(
              title: 'تسجيل بواسطة فيسبوك',
              onPress: () {
                // context.read<LoginCubit>().signInWithFacebook();
              },
              iconImage: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
