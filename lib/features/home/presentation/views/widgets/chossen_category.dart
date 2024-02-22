import 'package:ecommerce_app/features/home/presentation/views/widgets/un_chossen_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ChoosenCategory extends StatelessWidget {
  const ChoosenCategory({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        ImageData.rectangleBorder,
                        width: 7.w,
                        height: 72.h,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Men’s Fashion',
                        style: Styles.textStyle14.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        : const UnChossenCategory();
  }
}
