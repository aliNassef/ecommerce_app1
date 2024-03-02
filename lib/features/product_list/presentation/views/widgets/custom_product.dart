import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/ProdductDetails');
      },
      child: AspectRatio(
        aspectRatio: 191 / 273,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15),
            border: Border.all(
              color: const Color(0xff004182).withOpacity(0.3),
              width: 2.w,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageData.product,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike Air Jordon',
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Nike shoes flexible for wo..',
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'EGP 1,200 ',
                            style: Styles.textStyle14.copyWith(
                              color: kTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '2000 EGP',
                            style: Styles.textStyle14.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              height: 3.h,
                              color: const Color(0xff004182).withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, right: 8),
                      child: Row(
                        children: [
                          Text(
                            'Review (4.6) ',
                            style: Styles.textStyle14.copyWith(
                              fontSize: 12.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.yellow,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.add_circle,
                            color: kPrimaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
