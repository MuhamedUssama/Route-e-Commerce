import 'package:e_commerce/data/data_source/category_data_source_contract.dart';
import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:e_commerce/domain/repository/category_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRpositoryContract)
class CategoryRepositoryImpl implements CategoryRpositoryContract {
  CategoryDataSource categoryDataSource;
  @factoryMethod
  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<List<Category>?> getCategories() {
    return categoryDataSource.getCategories();
  }
}
