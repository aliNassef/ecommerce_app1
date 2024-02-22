import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_search_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6.h,
          ),
          Image.asset(
            ImageData.routeAppBar,
            height: 22.h,
            width: 66.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              const Expanded(
                child: CustomSearchBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Image.asset(
                  ImageData.shoppingCart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
