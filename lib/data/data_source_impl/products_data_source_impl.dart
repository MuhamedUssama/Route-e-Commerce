import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/products_data_source.dart';
import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDataSource)
class ProductDataSourceImpl implements ProductsDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductDataSourceImpl(this.apiManager);

  @override
  Future<List<Product>?> getProducts({
    ProductSort? sortBy,
    String? subCategoryId,
    String? categoryId,
    String? brandId,
  }) async {
    var response = await apiManager.getAllProducts(
      sort: sortBy,
      subCategoryId: subCategoryId,
      categoryId: categoryId,
      brandId: brandId,
    );
    var prouductResponse =
        response.data?.map((productDto) => productDto.toProduct()).toList();
    return prouductResponse;
  }
}
