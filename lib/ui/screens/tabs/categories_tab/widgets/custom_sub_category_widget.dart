import 'package:e_commerce/domain/models/sub_categories/sub_categories.dart';
import 'package:e_commerce/ui/utils/constants/image_constats.dart';
import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSubCategoryWidget extends StatelessWidget {
  final SubCategory subCategory;
  const CustomSubCategoryWidget({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(ImagesBath.subCategoryImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subCategory.name ?? "",
            style: const TextStyle(
              color: AppColors.primaryolor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
