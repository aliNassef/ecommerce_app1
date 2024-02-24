import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class NumberOfItems extends StatelessWidget {
  const NumberOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        children: [
          const Icon(
            Icons.remove_circle_outline_sharp,
            color: Colors.white,
            size: 20,
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
          const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
