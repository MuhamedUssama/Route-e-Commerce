import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:e_commerce/domain/use_cases/get_products_catalog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCatalogViewModel extends Cubit<ProductsCatalogStates> {
  GetProductsCatalogUseCase productsCatalog;

  @factoryMethod
  ProductsCatalogViewModel(this.productsCatalog) : super(LoadingState());

  void loadProducts(SubCategory? subCategory) async {
    emit(LoadingState());
    try {
      var products = await productsCatalog.invoke(subCategory?.id);
      emit(SuccessState(products));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class ProductsCatalogStates {}

class LoadingState extends ProductsCatalogStates {}

class ErrorState extends ProductsCatalogStates {
  String? message;
  ErrorState(this.message);
}

class SuccessState extends ProductsCatalogStates {
  List<Product>? products;
  SuccessState(this.products);
}
