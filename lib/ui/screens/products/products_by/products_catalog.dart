import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:e_commerce/ui/screens/products/products_by/product_catalog_view_model.dart';
import 'package:e_commerce/ui/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCatalog extends StatelessWidget {
  static const String routeName = "productsCatalog";
  ProductsCatalog({super.key});

  final viewModel = getIt.get<ProductsCatalogViewModel>();

  @override
  Widget build(BuildContext context) {
    var subCategory = ModalRoute.of(context)?.settings.arguments as SubCategory;
    viewModel.loadProducts(subCategory);

    return Scaffold(
      body: BlocBuilder<ProductsCatalogViewModel, ProductsCatalogStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                state.message ?? "Something went worng, please try again",
              ),
            );
          } else if (state is SuccessState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 8,
                childAspectRatio: 8 / 16,
              ),
              itemBuilder: (context, index) {
                return CustomProductWidget(
                  product: state.products![index],
                );
              },
              itemCount: state.products!.length,
              scrollDirection: Axis.vertical,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
