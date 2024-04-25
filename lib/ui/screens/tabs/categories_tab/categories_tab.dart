import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/cubits/categories/categories_tab_states.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/cubits/categories/categories_tab_view_model.dart';
import 'package:e_commerce/ui/screens/tabs/categories_tab/cubits/sub_categories/sub_categories_on_category_view_model.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/sub_categories/sub_categories_on_category_states.dart';
import 'widgets/category_clicked_tab.dart';
import 'widgets/custom_sub_category_widget.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  CategoriesTabViewModel categoriesViewModel =
      getIt.get<CategoriesTabViewModel>();

  SubCategoriesOnCategoryViewModel subCategoriesViewModel =
      getIt.get<SubCategoriesOnCategoryViewModel>();

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
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.36,
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
                                    subCategoriesViewModel
                                        .getSubCategoriesOnCategory(null);
                                  } else {
                                    selectedIndex = index;
                                    subCategoriesViewModel
                                        .getSubCategoriesOnCategory(
                                            state.category![index].id);
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
          BlocBuilder(
            bloc: subCategoriesViewModel,
            builder: (context, state) {
              if (state is SubCategoriesLoadingState) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (state is SubCategoriesErrorState) {
                return Center(
                  child: Text(state.errorMessage ??
                      "Something went worng, please try again"),
                );
              } else if (state is SubCategoriesSuccessState) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            return CustomSubCategoryWidget(
                              subCategory: state.subCategories![index],
                            );
                          },
                          itemCount: state.subCategories!.length,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
