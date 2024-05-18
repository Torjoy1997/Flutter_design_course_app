import 'package:flutter/material.dart';

class SidebarItem {
  SidebarItem(
      {required this.title,
      required this.background,
      required this.icon,
      this.onTap});

  String title;
  LinearGradient background;
  Icon icon;
  Function(BuildContext)? onTap;
}
