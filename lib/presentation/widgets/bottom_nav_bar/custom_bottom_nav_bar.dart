import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/resources/app_colors.dart';
import 'bottom_nav_destination.dart';
import 'custom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const List<BottomNavDestination> _destinations =
      <BottomNavDestination>[
        BottomNavDestination(
          label: 'الرئيسية',
          icon: Icons.home_outlined,
          selectedIcon: Icons.home_outlined,
        ),
        BottomNavDestination(
          label: 'طلباتي',
          icon: Icons.schema_outlined,
        ),
        BottomNavDestination(
          label: 'المستندات',
          icon: Icons.work_outline_rounded,
        ),
        BottomNavDestination(
          label: 'المزيد',
          icon: Icons.more_horiz_rounded,
        ),
      ];

  void _selectDestination(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: AppColors.backGround,
    child: SafeArea(
      top: false,
      minimum: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x17000000),
              blurRadius: 18,
              offset: Offset(0, 5),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List<Widget>.generate(_destinations.length, (index) {
            final destination = _destinations[index];
            return Expanded(
              child: CustomNavItem(
                label: destination.label,
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                selected: navigationShell.currentIndex == index,
                onPressed: () => _selectDestination(index),
              ),
            );
          }),
        ),
      ),
    ),
  );
}
