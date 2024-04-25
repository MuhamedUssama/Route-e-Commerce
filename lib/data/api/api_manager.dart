import 'dart:convert';

import 'package:e_commerce/data/models/brands_response/brands_response.dart';
import 'package:e_commerce/data/models/categories_response/categories_response.dart';
import 'package:e_commerce/data/models/product_response/product_response.dart';
import 'package:e_commerce/data/models/sub_categories_response/sub_categories_response.dart';
import 'package:e_commerce/domain/repository/product_repository_contract.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManager {
  static const String baseUrl = "ecommerce.routemisr.com";

  Future<CategoriesResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, "api/v1/categories");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    return categoriesResponse;
  }

  Future<BrandsResponse> getAllBrands() async {
    Uri url = Uri.https(baseUrl, "api/v1/brands");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    BrandsResponse brandsResponce = BrandsResponse.fromJson(json);
    return brandsResponce;
  }

  Future<ProductResponse> getAllProducts(
      {ProductSort? sort, String? subCategoryId}) async {
    Map<String, dynamic> params = {};
    if (sort != null) {
      params["sort"] = sort.value;
    }

    if (subCategoryId != null) {
      params["subcategory"] = subCategoryId;
    }
    Uri url = Uri.https(baseUrl, "/api/v1/products", params);
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }

  Future<SubCategoiesResponce> getSubCategoriesOnCategory(String? id) async {
    Uri url = Uri.https(baseUrl, "api/v1/categories/$id/subcategories");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SubCategoiesResponce subCategoiesResponce =
        SubCategoiesResponce.fromJson(json);
    return subCategoiesResponce;
  }
}
