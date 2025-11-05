import 'package:flutter/material.dart';
import 'package:fruit_shop/core/shared/bottom_navigation_bar/active_navigation_bar_item.dart';
import 'package:fruit_shop/core/shared/bottom_navigation_bar/inactive_bottom_navigation_bar_item.dart';
import 'package:fruit_shop/Feature/home/domain/entity/bottom_navigation_bar_entity.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.entity,
  });
  final bool isActive;
  final BottomNavigationBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          alwaysIncludeSemantics: true,
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: isActive
          ? ActiveItem(
              key: const ValueKey('active'),
              image: entity.activeImage,
              text: entity.name,
            )
          : InActiveItem(
              key: const ValueKey('inactive'),
              image: entity.inActiveImage,
            ),
    );
  }
}
