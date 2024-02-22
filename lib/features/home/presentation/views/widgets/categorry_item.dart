import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              ImageData.menFashion,
            ),
          ),
          Text(
            'men’s\nfashion',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xFF06004F),
            ),
          ),
        ],
      ),
    );
  }
}
