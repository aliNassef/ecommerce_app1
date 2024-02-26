import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/home/data/models/categorey_model/categorey_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoreyModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            // image not equal null sin api
            backgroundImage: NetworkImage(category.image!),
          ),
          Text(
            category.name!,
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
