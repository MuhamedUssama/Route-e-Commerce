import 'Metadata.dart';
import 'Data.dart';

class ProductResponses {
  ProductResponses({
      this.results, 
      this.metadata, 
      this.data,});

  ProductResponses.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<Data>? data;
ProductResponses copyWith({  int? results,
  Metadata? metadata,
  List<Data>? data,
}) => ProductResponses(  results: results ?? this.results,
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