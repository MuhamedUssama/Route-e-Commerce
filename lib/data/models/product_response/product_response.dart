import 'package:e_commerce/data/models/pagenation_dto.dart';

import 'product_dto.dart';

class ProductResponse {
  int? results;
  PagenationDto? metadata;
  List<ProductDto>? data;

  ProductResponse({
    this.results,
    this.metadata,
    this.data,
  });

  ProductResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PagenationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  ProductResponse copyWith({
    int? results,
    PagenationDto? metadata,
    List<ProductDto>? data,
  }) =>
      ProductResponse(
        results: results ?? this.results,
        metadata: metadata ?? this.metadata,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
