import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';

sealed class SubCategoriesOnCategoryStates {}

class SubCategoriesLoadingState extends SubCategoriesOnCategoryStates {}

class SubCategoriesErrorState extends SubCategoriesOnCategoryStates {
  String? errorMessage;
  SubCategoriesErrorState(this.errorMessage);
}

class SubCategoriesSuccessState extends SubCategoriesOnCategoryStates {
  List<SubCategory>? subCategories;
  SubCategoriesSuccessState(this.subCategories);
}
