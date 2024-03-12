import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'add_cart_button.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xff004182).withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 140.h,
            width: 120.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xff004182).withOpacity(0.3),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  ImageData.product,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Nike Air Jordon',
                        style: Styles.textStyle18.copyWith(
                          color: kTextColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Center(
                          child: Image.asset(
                            ImageData.fav,
                            height: 50.h,
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 7.5,
                      ),
                      Text(
                        ' Orange',
                        style: Styles.textStyle14.copyWith(
                          color: const Color(0xff06004F).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'EGP 3,500 ',
                        style: Styles.textStyle14.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'EGP 1,500',
                        style: Styles.textStyle18.copyWith(
                          color: const Color(0xff06004F).withOpacity(0.6),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 42.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const AddToCartButton(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
