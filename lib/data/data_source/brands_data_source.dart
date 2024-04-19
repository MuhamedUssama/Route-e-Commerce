import 'package:e_commerce/domain/models/brands/brands.dart';

abstract class BrandsDataSource {
  Future<List<Brand>?> getBrands();
}
