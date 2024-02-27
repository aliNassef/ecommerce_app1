import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'custom_category_list_view_for_choosen.dart';
import 'custom_grid_view.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: Row(
            children: [
              const CustomCategoryListViewForChoose(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Men’s Fashion',
                        style: Styles.textStyle14.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Image.asset(
                        ImageData.fashin,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomGridView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
