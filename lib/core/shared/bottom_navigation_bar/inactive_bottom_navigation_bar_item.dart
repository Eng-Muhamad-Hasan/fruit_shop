import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    // Constrain the inactive icon to the same visual bounds as the active
    // item so AnimatedSwitcher doesn't cause overflow when switching.
    return Center(
      child: SizedBox(
        height: 30,
        width: 80,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 18,
            height: 18,
            color: Colors.transparent,
            child: SvgPicture.asset(image, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
