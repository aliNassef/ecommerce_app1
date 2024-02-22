import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';

class CarsouselImages extends StatelessWidget {
  const CarsouselImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          height: 300.h,
          viewportFraction: 1,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Image.asset(
            ImageData.productImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
