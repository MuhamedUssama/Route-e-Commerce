import 'package:e_commerce/domain/models/brands/Brands.dart';

abstract class BrandRepositoryContract {
  Future<List<Brand>?> getBrands();
}
