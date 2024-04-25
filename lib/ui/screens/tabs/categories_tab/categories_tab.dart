import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/category_clicked_tab.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  List<String> test = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Emma',
    'Frank',
    'Grace',
    'Henry Potter',
    'Isabel',
    'Jack'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryolor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CustomCategoryTabClick(
                        categoryName: test[index],
                        isClicked: index == selectedIndex,
                        onClick: () {
                          setState(() {
                            if (index == selectedIndex) {
                              selectedIndex = 0;
                            } else {
                              selectedIndex = index;
                            }
                          });
                        },
                      ),
                      itemCount: test.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 6,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
