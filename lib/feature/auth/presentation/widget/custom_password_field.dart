import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/custom_text_form_field.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.onSaved});
  final void Function(String?) onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;
  _CustomPasswordFieldState();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: _obscureText,
      hintText: "كلمة المرور",
      textInputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: AppColors.formEyeColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      onSaved: widget.onSaved,
    );
  }
}
