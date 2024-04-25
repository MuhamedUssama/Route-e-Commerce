import 'package:e_commerce/domain/models/categories/category.dart';

sealed class CategoriesTabStates {}

class LoadingState extends CategoriesTabStates {}

class ErrorState extends CategoriesTabStates {
  String? message;
  ErrorState(this.message);
}

class SuccessState extends CategoriesTabStates {
  List<Category>? category;
  SuccessState(this.category);
}
