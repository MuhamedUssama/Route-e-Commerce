import 'package:e_commerce/domain/models/sun_categories/sub_categories.dart';

class SubCategoriesDto {
  SubCategoriesDto({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoriesDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
  SubCategoriesDto copyWith({
    String? id,
    String? name,
    String? slug,
    String? category,
    String? createdAt,
    String? updatedAt,
  }) =>
      SubCategoriesDto(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  SubCategory toSubCategory() {
    return SubCategory(
      id: id,
      name: name,
      slug: slug,
      category: category,
    );
  }
}
