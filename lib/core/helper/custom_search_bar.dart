import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../utils/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              ('what do you search for?'),
              style: Styles.textStyle14,
            ),
          ],
        ),
      ),
    );
  }
}
