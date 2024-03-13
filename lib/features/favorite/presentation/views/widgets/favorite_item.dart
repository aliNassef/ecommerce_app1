import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/fav_model/datum.dart';
import 'add_cart_button.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.data,
  });
  final Datum data;
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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: data.imageCover!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        data.title!.substring(0, 11),
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
                      Text(
                        'Brand : ${data.brand!.name!}',
                        style: Styles.textStyle16.copyWith(
                          color: kTextColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'EGP ${data.price} ',
                        style: Styles.textStyle14.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
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
