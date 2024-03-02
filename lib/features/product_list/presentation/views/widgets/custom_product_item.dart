
import 'package:flutter/material.dart';

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
          bottom: 180,
          left: 105,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(ImageData.unfav),
          ),
        ),
      ],
    );
  }
}
