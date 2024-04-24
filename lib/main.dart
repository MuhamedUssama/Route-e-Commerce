import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/utils/routes/app_routes.dart';
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
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
