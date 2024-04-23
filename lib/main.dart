import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/tabs/main_screen.dart';
import 'package:e_commerce/ui/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route E-Commerce',
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
