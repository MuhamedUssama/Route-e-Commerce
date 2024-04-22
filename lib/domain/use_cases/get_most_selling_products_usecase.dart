import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostSellingProductsUseCase {
  ProductRepositoryContract productRepositoryContract;

  @factoryMethod
  GetMostSellingProductsUseCase(this.productRepositoryContract);

  Future<List<Product>?> invoke() {
    return productRepositoryContract.getProducts(
      sortedBy: ProductSort.mostSelling,
    );
  }
}
