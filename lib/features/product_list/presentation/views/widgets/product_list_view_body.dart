import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/views/widgets/custom_app_bar.dart';
import 'custom_product_item.dart';

class ProductListViewBody extends StatelessWidget {
  const ProductListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        SizedBox(
          height: 24.h,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 180 / 273,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
            ),
            itemBuilder: (context, index) {
              return const CustomProductItem();
            },
          ),
        )
      ],
    );
  }
}
