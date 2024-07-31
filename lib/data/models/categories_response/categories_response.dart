import '../pagenation_dto.dart';
import 'category_dto.dart';

class CategoriesResponse {
  int? results;
  PagenationDto? metadata;
  List<CategoryDto>? data;

  CategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PagenationDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDto.fromJson(v));
      });
    }
  }

  CategoriesResponse copyWith({
    int? results,
    PagenationDto? metadata,
    List<CategoryDto>? data,
  }) =>
      CategoriesResponse(
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
