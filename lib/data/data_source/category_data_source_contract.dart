import 'package:e_commerce/domain/models/categories/category.dart';

abstract class CategoryDataSource {
  Future<List<Category>?> getCategories();
}
