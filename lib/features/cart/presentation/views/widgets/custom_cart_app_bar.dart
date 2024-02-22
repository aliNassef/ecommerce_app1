import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CustomCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
      ),
      title: Text(
        'Cart',
        style: Styles.textStyle18.copyWith(
          fontSize: 20.sp,
          color: kTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: kPrimaryColor,
            size: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              ImageData.shoppingCart,
              height: 24,
              width: 24,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
