import 'package:e_commerce/domain/models/products/products.dart';

abstract class ProductRepositoryContract {
  Future<List<Product>?> getProducts({ProductSort sortedBy});
}

enum ProductSort {
  lowestPrice("price"),
  highestPrice("-price"),
  mostSelling("-sold");

  final String value;
  const ProductSort(this.value);
}
