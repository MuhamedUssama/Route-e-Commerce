import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/models/products/products.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  final Product product;
  const CustomProductWidget({super.key, required this.product});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 4) {
      return title;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 280,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: AppColors.primaryolor.withOpacity(0.5),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover ?? "",
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(product.title ?? ""),
                      style: const TextStyle(
                        color: AppColors.primaryolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "EGP ${product.price ?? 0}",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.primaryolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Reviews",
                              style: TextStyle(
                                color: AppColors.primaryolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${product.ratingsAverage ?? 0}",
                              style: const TextStyle(
                                color: AppColors.primaryolor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_rounded),
                          color: AppColors.primaryolor.withOpacity(0.8),
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
