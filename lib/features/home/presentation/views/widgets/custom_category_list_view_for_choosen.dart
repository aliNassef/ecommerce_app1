import 'package:ecommerce_app/features/home/presentation/views/manger/sub_category/sub_category_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/chossen_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/sub_category_model/datum.dart';

class CustomCategoryListViewForChoose extends StatefulWidget {
  const CustomCategoryListViewForChoose({
    super.key,
  });

  @override
  State<CustomCategoryListViewForChoose> createState() =>
      _CustomCategoryListViewForChooseState();
}

class _CustomCategoryListViewForChooseState
    extends State<CustomCategoryListViewForChoose> {
  @override
  void initState() {
    context.read<BrandCategoryCubit>().fetchAllBrandCategories();
     super.initState();
  }

  int currentIndex = 0;
  List<Datum> subCategories = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 24),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Color(
                0xff004182,
              ),
            ),
            top: BorderSide(
              color: Color(
                0xff004182,
              ),
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
          color: Color(0xffEDF1F5),
        ),
        height: MediaQuery.of(context).size.height * .73,
        width: 137.w,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: subCategories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: ChoosenCategory(
                  isActive: currentIndex == index, model: subCategories[index]),
            );
          },
        ),
      ),
    );
  }
}
