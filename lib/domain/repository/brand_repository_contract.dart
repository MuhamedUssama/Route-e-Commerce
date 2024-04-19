import 'package:e_commerce/domain/models/brands/brands.dart';

abstract class BrandsRepositoryContract {
  Future<List<Brand>?> getBrands();
}
