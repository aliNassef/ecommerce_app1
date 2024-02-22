import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        hintText: 'Mohamed Mohamed Nabil',
        hintStyle: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w500,
          color: kTextColor,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(9.5),
          child: Image.asset(
            ImageData.edditIcon,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.fill,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: const Color(0xff004182).withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: const Color(0xff004182).withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
