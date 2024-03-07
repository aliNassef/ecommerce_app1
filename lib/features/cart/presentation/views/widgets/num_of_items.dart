
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class NumOfItems extends StatelessWidget {
  const NumOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.remove_circle_outline_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            width: 22.w,
          ),
          Text(
            '1',
            style: Styles.textStyle18,
          ),
          SizedBox(
            width: 19.w,
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
