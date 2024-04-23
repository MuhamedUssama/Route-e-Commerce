import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/tabs/main_screen.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryolor),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
      },
      initialRoute: MainScreen.routeName,
    );
  }
}
