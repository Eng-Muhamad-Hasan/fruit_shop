import 'package:flutter/material.dart';
import 'package:fruit_shop/Feature/home/domain/entity/bottom_navigation_bar_entity.dart';
import 'bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getBottomNavigationBarEntityList.asMap().entries.map((e) {
          final index = e.key;
          final entity = e.value;
          return Expanded(
            flex: index == widget.currentIndex ? 2 : 1,
            child: InkWell(
              onTap: () {
                widget.onTap(index);
              },
              child: NavigationBarItem(
                isActive: widget.currentIndex == index,
                entity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
