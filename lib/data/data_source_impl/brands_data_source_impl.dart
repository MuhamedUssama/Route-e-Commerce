import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/data_source/brands_data_source.dart';
import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsDataSource)
class BrandsDataSourceImpl implements BrandsDataSource {
  ApiManager apiManager;

  @factoryMethod
  BrandsDataSourceImpl(this.apiManager);

  @override
  Future<List<Brand>?> getBrands() async {
    var response = await apiManager.getAllBrands();
    var brandsResponse =
        response.data!.map((brandDto) => brandDto.toBrand()).toList();
    return brandsResponse;
  }
}
