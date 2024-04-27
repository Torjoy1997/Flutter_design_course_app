import 'package:flutter/material.dart';

import '../../config/global_contex.dart';

class AppHelperFunctions {
  static double screenWidth =
      MediaQuery.of(NavigationService.currentContex).size.width;
  static double screenHeight =  MediaQuery.of(NavigationService.currentContex).size.height;
}
