import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/image_constats.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = 'mainScreen';
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryolor,
            icon: ImageIcon(
              AssetImage(ImagesBath.homeTabIcon),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryolor,
            icon: ImageIcon(
              AssetImage(ImagesBath.categoryTabIcon),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryolor,
            icon: ImageIcon(
              AssetImage(ImagesBath.heartTabIcon),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.primaryolor,
            icon: ImageIcon(
              AssetImage(ImagesBath.userTabIcon),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
