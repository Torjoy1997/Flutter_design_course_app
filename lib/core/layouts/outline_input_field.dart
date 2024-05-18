import 'package:flutter/material.dart';

class OutLineInputFieldLayout extends StatelessWidget {
  const OutLineInputFieldLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(elevation: 3, child: child),
    );
  }
}
