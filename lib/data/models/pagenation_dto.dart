class PagenationDto {
  PagenationDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  PagenationDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;
  PagenationDto copyWith({
    int? currentPage,
    int? numberOfPages,
    int? limit,
  }) =>
      PagenationDto(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
