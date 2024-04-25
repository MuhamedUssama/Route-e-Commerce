import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';

sealed class SubCategoriesOnCategoryStates {}

class LoadingState extends SubCategoriesOnCategoryStates {}

class ErrorState extends SubCategoriesOnCategoryStates {
  String? errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends SubCategoriesOnCategoryStates {
  List<SubCategory>? subCategories;
  SuccessState(this.subCategories);
}
