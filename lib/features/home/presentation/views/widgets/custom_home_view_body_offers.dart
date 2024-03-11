import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../../constants.dart';

class CustomHomeViewBodyOffers extends StatelessWidget {
  const CustomHomeViewBodyOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: ImageSlideshow(
        indicatorRadius: 5,
        indicatorColor: kPrimaryColor,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 10000,
        isLoop: true,
        children: [
          Image.asset(
            kOffers[0],
            fit: BoxFit.fill,
          ),
          Image.asset(
            kOffers[1],
            fit: BoxFit.fill,
          ),
          Image.asset(
            kOffers[2],
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
