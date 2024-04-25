import 'package:e_commerce/data/data_source/sub_categories_on_category_data_source.dart';
import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:e_commerce/domain/repository/sub_categories_on_category_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesOnCategoryRepositoryContract)
class SubCategoriesOnCategoryRepoImpl
    implements SubCategoriesOnCategoryRepositoryContract {
  SubCategoriesOnCategoryDataSource subCategoriesOnCategoryDataSource;

  @factoryMethod
  SubCategoriesOnCategoryRepoImpl(this.subCategoriesOnCategoryDataSource);

  @override
  Future<List<SubCategory>?> getSubCategoriesOnCategory(String? id) async {
    var subCategoriesOnCategory =
        await subCategoriesOnCategoryDataSource.getSubCategoriesOnCategory(id);

    return subCategoriesOnCategory;
  }
}
