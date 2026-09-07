import 'package:flutter/material.dart';

@immutable
class BottomNavDestination {
  const BottomNavDestination({
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData? selectedIcon;
}
