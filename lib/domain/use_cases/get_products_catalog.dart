import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsCatalogUseCase {
  ProductRepositoryContract productRepositoryContract;

  @factoryMethod
  GetProductsCatalogUseCase(this.productRepositoryContract);

  Future<List<Product>?> invoke(
    String? subCategoryId,
    String? categoryId,
    String? brandId,
  ) {
    return productRepositoryContract.getProducts(
      sortedBy: ProductSort.mostSelling,
      subCategoryId: subCategoryId,
      categoryId: categoryId,
      brandId: brandId,
    );
  }
}
