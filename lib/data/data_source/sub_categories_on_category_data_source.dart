import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';

abstract class SubCategoriesOnCategoryDataSource {
  Future<List<SubCategory>?> getSubCategoriesOnCategory(String? id);
}
