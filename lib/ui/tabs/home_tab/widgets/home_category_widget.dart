import 'package:e_commerce/domain/models/categories/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  final Category categoryList;
  const HomeCategoryWidget({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CachedNetworkImage(
          height: height * 0.12,
          width: width * 0.22,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          imageUrl: categoryList.image ?? "",
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
        Text(categoryList.name ?? ""),
      ],
    );
  }
}
