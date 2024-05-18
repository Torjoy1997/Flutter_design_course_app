import 'package:flutter/material.dart';

import '../model/sidebar_items_model.dart';

class SidebarRow extends StatelessWidget {
  const SidebarRow({
    super.key,
    required this.item,
  });

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.onTap != null) {
          item.onTap!(context);
        }
      },
      child: Row(
        children: [
          Container(
            width: 42.0,
            height: 42.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              gradient: item.background,
            ),
            child: item.icon,
          ),
          const SizedBox(width: 12),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
        ],
      ),
    );
  }
}
