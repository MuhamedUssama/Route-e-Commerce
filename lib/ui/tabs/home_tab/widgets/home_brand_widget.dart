import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBrandWidget extends StatelessWidget {
  final Brand brand;
  const HomeBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 124,
          width: 124,
          imageUrl: brand.image ?? "",
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
        Text(brand.name ?? ""),
      ],
    );
  }
}
