import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:e_commerce/domain/repository/brand_repository_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  BrandsRepositoryContract brandsRepositoryContract;

  @factoryMethod
  GetBrandsUseCase(this.brandsRepositoryContract);

  Future<List<Brand>?> invoke() {
    return brandsRepositoryContract.getBrands();
  }
}
