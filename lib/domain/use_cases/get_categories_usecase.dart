import 'package:e_commerce/domain/repository/category_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../models/categories/category.dart';

@injectable
class GetCategoriesUseCase {
  CategoryRpositoryContract repository;

  @factoryMethod
  GetCategoriesUseCase(this.repository);

  Future<List<Category>?> invoke() {
    return repository.getCategories();
  }
}
