import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/use_cases/get_brands_usecase.dart';
import 'package:e_commerce/domain/use_cases/get_categories_usecase.dart';
import 'package:e_commerce/domain/use_cases/get_most_selling_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetMostSellingProductsUseCase mostSellingProducts;

  @factoryMethod
  HomeTabViewModel(
    this.getCategoriesUseCase,
    this.getBrandsUseCase,
    this.mostSellingProducts,
  ) : super(LoadingState());

  void initPage() async {
    emit(LoadingState());

    try {
      var categories = await getCategoriesUseCase.invoke();
      var brands = await getBrandsUseCase.invoke();
      var products = await mostSellingProducts.invoke();

      emit(SuccessState(categories, brands, products));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}

sealed class HomeTabStates {}

class LoadingState extends HomeTabStates {}

class ErrorState extends HomeTabStates {
  String? errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends HomeTabStates {
  List<Category>? categoryList;
  List<Brand>? brandList;
  List<Product>? productList;
  SuccessState(this.categoryList, this.brandList, this.productList);
}
