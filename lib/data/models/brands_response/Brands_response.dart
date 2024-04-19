import 'package:e_commerce/data/models/pagenation_dto.dart';

import 'brands_dto.dart';

class BrandsResponse {
  int? results;
  PagenationDto? metadata;
  List<BrandsDto>? data;

  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  BrandsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PagenationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BrandsDto.fromJson(v));
      });
    }
  }

  BrandsResponse copyWith({
    int? results,
    PagenationDto? metadata,
    List<BrandsDto>? data,
  }) =>
      BrandsResponse(
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
