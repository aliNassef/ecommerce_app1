import 'package:ecommerce_app/features/home/data/models/categorey_model/categorey_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categorry_item.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({
    super.key,
    required this.categories,
  });
  final List<CategoreyModel> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categories[index],
          );
        },
      ),
    );
  }
}
