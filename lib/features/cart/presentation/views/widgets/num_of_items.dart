import 'package:ecommerce_app/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class NumOfItems extends StatelessWidget {
  const NumOfItems({
    super.key,
    required this.count,
    required this.id,
  });
  final int count;
  final String id;
  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().count = count;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<CartCubit>()
                    .updatedCountOfProduct(count: count - 1, id: id);
              },
              child: const Icon(
                Icons.remove_circle_outline_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 22.w,
          ),
          Text(
            '${context.read<CartCubit>().count}',
            style: Styles.textStyle18,
          ),
          SizedBox(
            width: 19.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<CartCubit>()
                    .updatedCountOfProduct(count: count + 1, id: id);
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
