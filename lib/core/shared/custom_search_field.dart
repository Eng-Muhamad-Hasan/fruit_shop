import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final has = _controller.text.isNotEmpty;
      if (has != _hasText) {
        setState(() => _hasText = has);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.start,
        controller: _controller,
        autocorrect: true,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 4.0),
            child: SvgPicture.asset(Assets.imagesSearchIcon),
          ),
          hint: Text(
            'ابحث عن.......',
            style: AppTextStyles.bodySmallRegular13.copyWith(
              color: AppColors.gray400,
            ),
          ),
          alignLabelWithHint: true,
          // combine clear button and filter icon in suffix area
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_hasText)
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                child: SvgPicture.asset(Assets.imagesFilterIcon),
              ),
            ],
          ),
          // remove underline/border
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
