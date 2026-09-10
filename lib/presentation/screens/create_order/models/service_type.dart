import 'package:flutter/material.dart';

class ServiceType {
  const ServiceType(this.title, this.icon, {this.enabled = true});

  final String title;
  final IconData icon;
  final bool enabled;
}
