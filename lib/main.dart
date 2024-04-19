import 'package:flutter/material.dart';

import 'ui/tabs/home_tab/home_tab.dart';

void main() {
  runApp(const ECommerce());
}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Route E-Commerce',
      debugShowCheckedModeBanner: false,
      home: HomeTab(),
    );
  }
}
