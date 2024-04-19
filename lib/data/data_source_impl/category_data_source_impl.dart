import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/category_data_source_contract.dart';
import 'package:e_commerce/domain/models/categories/category.dart';

class CategoryOnlineDataSource implements CategoryDataSource {
  ApiManager apiManager;
  CategoryOnlineDataSource(this.apiManager);

  @override
  Future<List<Category>?> getCategories() async {
    var responce = await apiManager.getAllCategories();
    var categoriesResponce =
        responce.data?.map((categoryDto) => categoryDto.toCategory()).toList();
    return categoriesResponce;
  }
}
