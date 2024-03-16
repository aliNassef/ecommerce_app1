import 'package:ecommerce_app/features/favorite/presentation/manger/cubit/fav_cubit.dart';
import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import 'custom_product.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.model});
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomProduct(data: model),
        Positioned(
          bottom: 248.h,
          left: 130.w,
          child: IconButton(
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.zero),
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<FavCubit>().addProductToWishList(id: model.id!);
            },
            icon: Image.asset(ImageData.unfav),
          ),
        ),
      ],
    );
  }
}
