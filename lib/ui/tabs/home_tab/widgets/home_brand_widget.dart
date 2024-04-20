import 'package:e_commerce/domain/models/brands/brands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBrandWidget extends StatelessWidget {
  final Brand brand;
  const HomeBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CachedNetworkImage(
          height: height * 0.1,
          width: width * 0.2,
          imageUrl: brand.image ?? "",
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      ],
    );
  }
}
