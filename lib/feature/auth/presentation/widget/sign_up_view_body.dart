import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/functions/show_log_snack_bar.dart';
import 'package:fruit_shop/core/shared/custom_button.dart';
import 'package:fruit_shop/core/shared/custom_text_form_field.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/Feature/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:fruit_shop/Feature/auth/presentation/widget/custom_checlbox.dart';
import 'package:fruit_shop/Feature/auth/presentation/widget/custom_password_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody>  createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String username, email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: "الاسم الكامل",
              textInputType: TextInputType.text,
              onSaved: (value) {
                username = value!;
              },
            ),
            const SizedBox(height: 16),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCheckBox(
                  isChecked: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),

                const SizedBox(width: 16),
                Expanded(
                  child: Text.rich(
                    // textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "من  خلال إنشاء حساب , فإنك توافق على ",
                          style: AppTextStyles.bodySemiBold13.copyWith(
                            color: AppColors.gray400,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.pushNamed(context, SignUpView.routeName);
                            },
                          text: "الشروط و الأحكام الخاصة بنا",
                          style: AppTextStyles.bodySemiBold13.copyWith(
                            color: AppColors.lighterPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (isChecked) {
                    context.read<SignUpCubit>().signUp(
                      username,
                      email,
                      password,
                    );
                  } else {
                    showLogSnackBar(
                      context,
                      "يجب الموافقة على الشروط و الأحكام",
                    );
                  }
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              textButton: "إنشاء حساب جديد",
            ),
            const SizedBox(height: 26),
            Text.rich(
              // textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "تمتلك حساب بالفعل؟",
                    style: AppTextStyles.bodySemiBold16.copyWith(
                      color: AppColors.gray400,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                    text: " تسجيل الدخول",
                    style: AppTextStyles.bodySemiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
