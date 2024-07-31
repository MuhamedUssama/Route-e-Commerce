import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/categories_tab.dart';
import 'package:e_commerce/ui/screens/tabs/favourites_tab/favourites_tab.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/home_tab.dart';
import 'package:e_commerce/ui/screens/tabs/main_screen_view_model.dart';
import 'package:e_commerce/ui/screens/tabs/user_tab/user_tab.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/image_constats.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'mainScreen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var viewModel = getIt.get<MainScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        int selectedIndex = 0;
        late Widget bodyWidget;
        switch (state) {
          case HomeTabState():
            {
              selectedIndex = 0;
              bodyWidget = const HomeTab();
            }
          case CategoriesTabState():
            {
              selectedIndex = 1;
              bodyWidget = const CategoriesTab();
            }
          case FavouriteTabState():
            {
              selectedIndex = 2;
              bodyWidget = const FavouritesTab();
            }
          case UserTabState():
            {
              selectedIndex = 3;
              bodyWidget = const UserTab();
            }
        }
        return Scaffold(
          body: bodyWidget,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (index) {
              viewModel.onTabClick(index);
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryolor,
                icon: selectedIndex == 0
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(AssetImage(ImagesBath.homeTabIcon),
                            color: AppColors.primaryolor))
                    : const ImageIcon(AssetImage(ImagesBath.homeTabIcon),
                        color: Colors.white),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryolor,
                icon: selectedIndex == 1
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(AssetImage(ImagesBath.categoryTabIcon),
                            color: AppColors.primaryolor))
                    : const ImageIcon(AssetImage(ImagesBath.categoryTabIcon),
                        color: Colors.white),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryolor,
                icon: selectedIndex == 2
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(AssetImage(ImagesBath.heartTabIcon),
                            color: AppColors.primaryolor))
                    : const ImageIcon(AssetImage(ImagesBath.heartTabIcon),
                        color: Colors.white),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryolor,
                icon: selectedIndex == 3
                    ? const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ImageIcon(AssetImage(ImagesBath.userTabIcon),
                            color: AppColors.primaryolor))
                    : const ImageIcon(AssetImage(ImagesBath.userTabIcon),
                        color: Colors.white),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
