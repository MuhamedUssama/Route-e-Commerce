import 'package:e_commerce/ui/tabs/home_tab/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt.get<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
