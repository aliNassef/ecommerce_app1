import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/product_details_cubit/product_details_cubit.dart';

class SizesContainer extends StatelessWidget {
  const SizesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return SizedBox(
          height: 35.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: kSizes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<ProductDetailsCubit>().choosingSize(index);
                },
                child: context.read<ProductDetailsCubit>().sizeIndex == index
                    ? CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Text(
                          '${kSizes[index]}',
                          style: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          '${kSizes[index]}',
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
              );
            },
          ),
        );
      },
    );
  }
}
