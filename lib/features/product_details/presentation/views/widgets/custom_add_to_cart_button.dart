import 'package:ecommerce_app/core/helper/awesome_dialog_method.dart';
import 'package:ecommerce_app/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddProducttoCartSuccess) {
          context.read<CartCubit>().updatedCountOfProduct(
              id: id, count: context.read<ProductDetailsCubit>().increment);
          GoRouter.of(context).push('/CartView');
        } else if (state is AddProducttoCartFailure) {
          awesomeDialogMethod(context, state.errMessage);
        } else {}
      },
      child: Expanded(
        child: GestureDetector(
          onTap: () async {
            debugPrint('${context.read<ProductDetailsCubit>().increment}');
            await context.read<CartCubit>().addProductToCart(id: id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryColor,
            ),
            height: 48.h,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
