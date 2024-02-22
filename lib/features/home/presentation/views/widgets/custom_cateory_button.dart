import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomCategoryButton extends StatelessWidget {
  const CustomCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style: Styles.textStyle18.copyWith(
              color: const Color(
                0xff06004F,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            onPressed: () {},
            child: Text(
              'view all',
              style: Styles.textStyle14.copyWith(
                fontSize: 12,
                color: const Color(0xff06004F),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
