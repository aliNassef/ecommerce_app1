import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_product.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const CustomProduct(),
        Positioned(
          bottom: 180.h,
          left: 105.w,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(ImageData.unfav),
          ),
        ),
      ],
    );
  }
}
