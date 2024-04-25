import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCategoryTabClick extends StatelessWidget {
  final String categoryName;
  final bool isClicked;
  final VoidCallback onClick;
  const CustomCategoryTabClick({
    Key? key,
    required this.categoryName,
    required this.isClicked,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: isClicked ? height * 0.1 : height * 0.075,
      color: isClicked ? Colors.white : AppColors.primaryolor.withOpacity(0),
      child: TextButton(
        onPressed: onClick,
        child: isClicked
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.8,
                    width: 6,
                    decoration: BoxDecoration(
                      color: AppColors.primaryolor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      categoryName,
                      style: const TextStyle(
                        color: AppColors.primaryolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            : Text(
                categoryName,
                style: const TextStyle(
                  color: AppColors.primaryolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
