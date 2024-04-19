import 'package:e_commerce/domain/repository/category_repository_contract.dart';

import '../models/categories/category.dart';

class GetCategoriesUseCase {
  CategoryRpositoryContract repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>?> invoke() {
    return repository.getCategories();
  }
}
