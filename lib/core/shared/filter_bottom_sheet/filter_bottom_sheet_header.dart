import 'package:flutter/material.dart';

class FilterBottomSheetHeader extends StatelessWidget {
  const FilterBottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFF131F46),
          ),
        ),
      ),
    );
  }
}
