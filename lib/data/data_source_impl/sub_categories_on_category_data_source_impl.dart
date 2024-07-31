import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/sub_categories_on_category_data_source.dart';
import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesOnCategoryDataSource)
class SubCategoriesOnCategoryDataSourceImpl
    implements SubCategoriesOnCategoryDataSource {
  ApiManager apiManager;

  @factoryMethod
  SubCategoriesOnCategoryDataSourceImpl(this.apiManager);

  @override
  Future<List<SubCategory>?> getSubCategoriesOnCategory(String? id) async {
    var response = await apiManager.getSubCategoriesOnCategory(id);

    var subCategoriesOnCategoryResponse = response.data!
        .map((subCategoryDto) => subCategoryDto.toSubCategory())
        .toList();

    return subCategoriesOnCategoryResponse;
  }
}
