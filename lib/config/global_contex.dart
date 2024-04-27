import 'package:flutter/material.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final currentContex = navigatorKey.currentContext!;

  // ... other methods and getters
}
