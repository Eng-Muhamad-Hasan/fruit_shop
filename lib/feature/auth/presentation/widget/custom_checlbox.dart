import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
final ValueChanged<bool> onChanged;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: GestureDetector(
        onTap: () {
            
            widget.onChanged(!widget.isChecked);
        },
        child: AnimatedContainer(
        
          padding:widget.isChecked? const EdgeInsets.all(4):null,
          duration: const Duration(milliseconds: 100),
          decoration: ShapeDecoration(color: widget.isChecked?AppColors.primaryColor:Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(width: 1.5, color: AppColors.formBorderColor),
            ),
          ),
          child:widget.isChecked? SvgPicture.asset(Assets.imagesCheckBox,
            fit: BoxFit.scaleDown,
          ):null,
        ),
      ),
    );
  }
}
