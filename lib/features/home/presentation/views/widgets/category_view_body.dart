import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'custom_category_list_view_for_choosen.dart';
import 'custom_grid_view.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomAppBar(),
        SizedBox(
          height: 16.h,
        ),
        const Row(
          children: [
            CustomCategoryListViewForChoose(),
          ],
        )
      ],
    );
  }
}
