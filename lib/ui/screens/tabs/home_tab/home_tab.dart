import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/home_tab_view_model.dart';
import 'package:e_commerce/ui/screens/tabs/home_tab/widgets/custom_head_list_row.dart';
import 'package:e_commerce/ui/utils/constants/image_constats.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:e_commerce/ui/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_brand_widget.dart';
import 'widgets/home_category_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt.get<HomeTabViewModel>();

  List<Widget> images = [
    Image.asset(ImagesBath.carouselSlider1),
    Image.asset(ImagesBath.carouselSlider2),
    Image.asset(ImagesBath.carouselSlider3),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is LoadingState) return false;
        if (current is ErrorState) return false;
        return true;
      },
      builder: (context, state) {
        if (state is SuccessState) {
          return buildSuccessWidget(state.categoryList ?? [],
              state.brandList ?? [], state.productList ?? []);
        }
        return Scaffold(
          appBar: AppBar(title: const Text('Defult Screen')),
          body: const Center(child: CircularProgressIndicator()),
        );
      },
      listenWhen: (previous, current) {
        if (current is LoadingState) return true;
        if (current is ErrorState) return true;
        return false;
      },
      listener: (context, state) {
        if (state is LoadingState) {
          // showLoading;
        }
        if (state is ErrorState) {
          // showError;
        }
      },
    );
  }

  Widget buildSuccessWidget(
    List<Category>? categoryList,
    List<Brand>? brandsList,
    List<Product>? productsList,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route eCommerce")),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox.fromSize(
              size: const Size(400, 200),
              child: CarouselSlider(
                items: images,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    changeIndex(index);
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the dots
              children: images.map((image) {
                int index = images.indexOf(image);
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.primaryolor
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox.fromSize(
              size: const Size.fromHeight(316),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomHeadListRow(listHeadName: "Cotegories"),
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HomeCategoryWidget(
                            categoryList: categoryList[index]);
                      },
                      itemCount: categoryList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: SizedBox.fromSize(
              size: const Size.fromHeight(224),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomHeadListRow(listHeadName: "Brands"),
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HomeBrandWidget(brand: brandsList[index]);
                      },
                      itemCount: brandsList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: SizedBox.fromSize(
              size: const Size.fromHeight(400),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomHeadListRow(
                      listHeadName: "Most Selling Products",
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          product: productsList[index],
                        );
                      },
                      itemCount: productsList!.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
