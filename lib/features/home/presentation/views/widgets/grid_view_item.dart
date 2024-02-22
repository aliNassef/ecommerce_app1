import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            ImageData.tShirt,
            height: 70.h,
            fit: BoxFit.fill,
            width: 70.w,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'T-shirts',
          style: Styles.textStyle14.copyWith(
            fontSize: 12.sp,
            color: kTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
