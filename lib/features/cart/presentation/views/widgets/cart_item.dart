import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'num_of_items.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
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
                  child: CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/350x150",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
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
                            icon: Image.asset(
                              ImageData.trash,
                              height: 24.h,
                              width: 24.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 7.5,
                        ),
                        Text(
                          'Orange ',
                          style: Styles.textStyle14.copyWith(
                            color: const Color(0xff06004F).withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                          child: const VerticalDivider(
                            thickness: 2,
                            width: 2,
                            color: Color(0xff6A6695),
                          ),
                        ),
                        Text(
                          ' Size 40',
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
                          'EGP 3,500',
                          style: Styles.textStyle18.copyWith(
                            color: kTextColor,
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
                          child: const NumOfItems(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
