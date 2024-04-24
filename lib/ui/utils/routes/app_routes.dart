import 'package:flutter/material.dart';

import '../../screens/tabs/main_screen.dart';

abstract class AppRoutes {
  static const String initialRoute = MainScreen.routeName;
  static Map<String, Widget Function(BuildContext)> routes = {
    MainScreen.routeName: (context) => const MainScreen(),
  };
}
