import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:e_commerce/domain/repository/sub_categories_on_category_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesOnCategoryUsecase {
  SubCategoriesOnCategoryRepositoryContract repository;

  @factoryMethod
  GetSubCategoriesOnCategoryUsecase(this.repository);

  Future<List<SubCategory>?> invoke(String? id) {
    return repository.getSubCategoriesOnCategory(id);
  }
}
