import 'package:flutter/material.dart';

class InactiveRadioButton extends StatelessWidget {
  const InactiveRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}
