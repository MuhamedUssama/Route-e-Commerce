import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'ui/screens/tabs/home_tab/home_tab.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryolor),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeTab(),
    );
  }
}
