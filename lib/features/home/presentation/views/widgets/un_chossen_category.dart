import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/sub_category_model/datum.dart';

class UnChossenCategory extends StatelessWidget {
  const UnChossenCategory({
    super.key,
    required this.model,
  });
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 32),
      child: Text(
        model.name!,
        style: Styles.textStyle14.copyWith(
          color: kTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
