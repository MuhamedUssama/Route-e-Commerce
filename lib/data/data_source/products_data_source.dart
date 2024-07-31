import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';

abstract class ProductsDataSource {
  Future<List<Product>?> getProducts(
      ProductSort? sortBy, String? subCategoryId);
}
