import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/favorite/presentation/manger/cubit/fav_cubit.dart';
import 'package:ecommerce_app/features/favorite/presentation/views/widgets/favorite_item.dart';
import 'package:ecommerce_app/features/home/data/models/categorey_model/categorey_model.dart';
import 'package:ecommerce_app/features/home/presentation/manger/category_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manger/category_cubit/categories_state.dart';
import 'package:ecommerce_app/features/home/presentation/manger/sub_category/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../manger/sub_category/sub_category_state.dart';
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
    context.read<FavCubit>().getFavProducts();
    super.initState();
  }

  List<CategoreyModel> categorries = [];
  List<CategoreyModel> brandCategorries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //  const CustomAppBar(),
                  SizedBox(
                    height: 10.h,
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
                          child:
                              CustomCategoryListView(categories: categorries),
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
                        return CustomCategoryListView(
                            categories: brandCategorries);
                      } else if (state is FailureFetchBrandCategories) {
                        return Center(
                          child: Text(state.errMessage),
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.white,
                          child: CustomCategoryListView(
                              categories: brandCategorries),
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
                        'Favorite Products',
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
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: CustomProductsHomeView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomProductsHomeView extends StatelessWidget {
  const CustomProductsHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.favModel.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FavoriteItem(data: state.favModel.data![index]),
              );
            },
          );
        } else if (state is FavFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
