import 'package:flutter/material.dart';

class InactiveFilterCheckBox extends StatelessWidget {
  const InactiveFilterCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: const EdgeInsets.all(2),
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}
