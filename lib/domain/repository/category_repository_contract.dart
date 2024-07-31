import 'package:e_commerce/domain/models/categories/category.dart';

abstract class CategoryRpositoryContract {
  Future<List<Category>?> getCategories();
}
