import 'package:e_commerce/data/data_source/brands_data_source.dart';
import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:e_commerce/domain/repository/brand_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepositoryContract)
class BrandsRepositoryImpl implements BrandsRepositoryContract {
  BrandsDataSource brandsDataSource;

  @factoryMethod
  BrandsRepositoryImpl(this.brandsDataSource);

  @override
  Future<List<Brand>?> getBrands() {
    return brandsDataSource.getBrands();
  }
}
