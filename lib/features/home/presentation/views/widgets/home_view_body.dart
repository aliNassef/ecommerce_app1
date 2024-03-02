import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/home/data/models/categorey_model/categorey_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/category_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/category_cubit/categories_state.dart';
import 'package:ecommerce_app/features/home/presentation/views/manger/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../manger/sub_category/sub_category_state.dart';
import 'custom_app_bar.dart';
import 'custom_category_list_view.dart';
import 'custom_cateory_button.dart';
import 'custom_home_view_body_offers.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<CategoriesCubit>().fetchCategories();
    context.read<BrandCategoryCubit>().fetchAllBrandCategories();
    super.initState();
  }

  List<CategoreyModel> categorries = [];
  List<CategoreyModel> brandCategorries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200.h,
                width: 398.w,
                child: const CustomHomeViewBodyOffers(),
              ),
              const CustomCategoryButton(),
              BlocConsumer<CategoriesCubit, CategoriesState>(
                listener: (context, state) {
                  if (state is SuccessFetchCategories) {
                    categorries = state.categories;
                  }
                },
                builder: (context, state) {
                  if (state is SuccessFetchCategories) {
                    return CustomCategoryListView(categories: categorries);
                  } else if (state is FailureFetchCategories) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.white,
                      child: CustomCategoryListView(categories: categorries),
                    );
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocConsumer<BrandCategoryCubit, BrandCategoryState>(
                listener: (context, state) {
                  if (state is SuccessFetchBrandCategories) {
                    brandCategorries = state.categories;
                  } else if (state is LoadingBrandCategories) {
                  } else {}
                },
                builder: (context, state) {
                  if (state is SuccessFetchBrandCategories) {
                    return CustomCategoryListView(categories: brandCategorries);
                  } else if (state is FailureFetchBrandCategories) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.white,
                      child:
                          CustomCategoryListView(categories: brandCategorries),
                    );
                  }
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Home Appliance',
                    style: Styles.textStyle18.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
   

      //  Scaffold(
      //       backgroundColor: Colors.white,
      //       body: Center(
      //         child: Text(
      //           state.errMessage,
      //           style: Styles.textStyle18.copyWith(
      //             color: kTextColor,
      //           ),
      //         ),
      //       ),
      //     );



      // Scaffold(
      //       backgroundColor: Colors.white,
      //       body: SafeArea(
      //         child: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               const CustomAppBar(),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               SizedBox(
      //                 height: 200.h,
      //                 width: 398.w,
      //                 child: const CustomHomeViewBodyOffers(),
      //               ),
      //               const CustomCategoryButton(),
      //               Shimmer.fromColors(
      //                 baseColor: Colors.grey.shade400,
      //                 highlightColor: Colors.white,
      //                 child: CustomCategoryListView(categories: categorries),
      //               ),
      //               SizedBox(
      //                 height: 16.h,
      //               ),
      //               
      //               SizedBox(
      //                 height: 24.h,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 16),
      //                 child: Align(
      //                   alignment: Alignment.topLeft,
      //                   child: Text(
      //                     'Home Appliance',
      //                     style: Styles.textStyle18.copyWith(
      //                       color: kTextColor,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      