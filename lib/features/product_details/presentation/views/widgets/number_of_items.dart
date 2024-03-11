import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class NumberOfItems extends StatelessWidget {
  const NumberOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ProductDetailsCubit>().decrement();
                },
                child: const Icon(
                  Icons.remove_circle_outline_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 22.w,
              ),
              Text(
                '${context.read<ProductDetailsCubit>().increment}',
                style: Styles.textStyle18,
              ),
              SizedBox(
                width: 19.w,
              ),
              GestureDetector(
                onTap: () {
                  context.read<ProductDetailsCubit>().incremrt();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
