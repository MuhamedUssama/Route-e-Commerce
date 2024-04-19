import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  final Category categoryList;
  const HomeCategoryWidget({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(64),
          child: CachedNetworkImage(
            height: 124,
            width: 124,
            imageUrl: categoryList.image ?? "",
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        Text(categoryList.name ?? ""),
      ],
    );
  }
}
