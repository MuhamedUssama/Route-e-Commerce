import 'package:flutter/material.dart';

import 'home.dart';

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
      home: Home(),
    );
  }
}
