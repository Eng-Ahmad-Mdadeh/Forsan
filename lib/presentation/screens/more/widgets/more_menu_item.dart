import 'package:flutter/material.dart';


class MoreMenuItem {
  const MoreMenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isDestructive;
}


