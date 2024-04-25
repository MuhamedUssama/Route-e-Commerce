import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/cubit/categories/categories_tab_states.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/cubit/categories/categories_tab_view_model.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/category_clicked_tab.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  CategoriesTabViewModel categoriesViewModel =
      getIt.get<CategoriesTabViewModel>();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.getCategories();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          BlocBuilder<CategoriesTabViewModel, CategoriesTabStates>(
            bloc: categoriesViewModel,
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.message ??
                      "Something went worng, please try again"),
                );
              } else if (state is SuccessState) {
                return Expanded(
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
                            itemBuilder: (context, index) =>
                                CustomCategoryTabClick(
                              categoryName: state.category![index].name ?? "",
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
                            itemCount: state.category!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
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
