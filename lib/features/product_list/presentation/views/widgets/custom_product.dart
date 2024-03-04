import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/product_list_model/datum.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.data});
  final Datum data;
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  //  color: Colors.black,
                  data.imageCover!,
                  height: 130.h,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title!,
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      data.description!,
                      maxLines: 2,
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${data.price}',
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
