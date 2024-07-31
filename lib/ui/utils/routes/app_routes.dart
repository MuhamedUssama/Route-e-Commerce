import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/products/products_by/products_catalog.dart';
import 'package:flutter/material.dart';

import '../../screens/auth/sign_up/sign_up_screen.dart';
import '../../screens/tabs/main_screen.dart';

abstract class AppRoutes {
  static const String initialRoute = LoginScreen.routeName;
  static const String homeScreen = MainScreen.routeName;
  static Map<String, Widget Function(BuildContext)> routes = {
    MainScreen.routeName: (context) => const MainScreen(),
    ProductsCatalog.routeName: (context) => ProductsCatalog(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
  };
}
