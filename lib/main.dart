import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/helpers/cashe.dart';
import 'package:e_commerce/helpers/constant.dart';
import 'package:e_commerce/ui/utils/routes/app_routes.dart';
import 'package:e_commerce/ui/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  var user =
      await SharedPreferencesHelper.getSecuredString(key: AppConstants.token);
  String? route;
  if (user == null || user == "") {
    route = AppRoutes.initialRoute;
  } else {
    route = AppRoutes.homeScreen;
  }
  runApp(ECommerce(route));
}

class ECommerce extends StatelessWidget {
  final String? initialRoute;
  const ECommerce(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route E-Commerce',
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: initialRoute,
    );
  }
}
