import 'dart:convert';

import 'package:e_commerce/data/models/categories_response/categories_response.dart';
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
}
