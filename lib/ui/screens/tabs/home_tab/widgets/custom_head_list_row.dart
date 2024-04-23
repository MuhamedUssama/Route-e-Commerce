import 'package:e_commerce/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomHeadListRow extends StatelessWidget {
  final String listHeadName;
  const CustomHeadListRow({super.key, required this.listHeadName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          listHeadName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryolor,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryolor,
              ),
            ),
          ),
          child: const Text("View All"),
        )
      ],
    );
  }
}
