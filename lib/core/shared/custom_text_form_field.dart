import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.bodyXSmallBold.copyWith(
          color: AppColors.gray400,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.formFillColor,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        // focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(width: 1, color: AppColors.formBorderColor),
  );
}
