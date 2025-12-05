import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        height: 30,
       
        child: Container(
      
          padding: const EdgeInsetsDirectional.only(end: 16),
          constraints: const BoxConstraints(minWidth: 80),
          decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: AppColors.green1_500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySemiBold11.copyWith(
                    color: AppColors.green1_500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
