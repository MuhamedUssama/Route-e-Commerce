import 'package:e_commerce/data/data_source/products_data_source.dart';
import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepositoryContract)
class ProductRepositoryImpl implements ProductRepositoryContract {
  ProductsDataSource productsDataSource;

  @factoryMethod
  ProductRepositoryImpl(this.productsDataSource);

  @override
  Future<List<Product>?> getProducts(
      {ProductSort? sortedBy, String? subCategoryId}) {
    return productsDataSource.getProducts(
        sortBy: sortedBy, subCategoryId: subCategoryId);
  }
}
