import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';
import 'package:ecommerce_app/features/product_list/presentation/manger/product_list_cubit/product_list_cubit.dart';
import 'package:ecommerce_app/features/product_list/presentation/manger/product_list_cubit/product_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../home/presentation/views/widgets/custom_app_bar.dart';
import 'custom_product_item.dart';

class ProductListViewBody extends StatefulWidget {
  const ProductListViewBody({super.key});

  @override
  State<ProductListViewBody> createState() => _ProductListViewBodyState();
}

class _ProductListViewBodyState extends State<ProductListViewBody> {
  @override
  void initState() {
    context.read<ProductListCubit>().getAllProducts();
    super.initState();
  }

  List<Datum> prodducts = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        SizedBox(
          height: 24.h,
        ),
        BlocConsumer<ProductListCubit, ProductListState>(
          listener: (context, state) {
            if (state is ProductListSuccessFetch) {
              prodducts = state.products;
            }
          },
          builder: (context, state) {
            if (state is ProductListSuccessFetch) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 180 / 273,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                  ),
                  itemCount: prodducts.length,
                  itemBuilder: (context, index) {
                    return CustomProductItem(
                      model: prodducts[index],
                    );
                  },
                ),
              );
            } else if (state is ProductListFailureFetch) {
              return Center(
                child: Text(
                  state.errMessage,
                ),
              );
            } else {
              return Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 180 / 273,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                    ),
                    itemBuilder: (context, index) {
                      return const CustomProductItem(model: Datum());
                    },
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
