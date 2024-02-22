
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class UnChossenCategory extends StatelessWidget {
  const UnChossenCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 32),
      child: Center(
        child: Text(
          'Men’s Fashion',
          style: Styles.textStyle14.copyWith(
            color: kTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}