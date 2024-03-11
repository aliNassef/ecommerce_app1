import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';
import 'cart_item.dart';
import 'check_out_button.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CartCubit>().getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartItems.data!.products!.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          item: state.cartItems.data!.products![index],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: Styles.textStyle18.copyWith(
                              color: const Color(0xff06004F).withOpacity(0.6),
                            ),
                          ),
                          Text(
                            'EGP ${state.cartItems.data!.totalCartPrice!}',
                            style: Styles.textStyle18.copyWith(
                              color: kTextColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      const CheckOutButton(),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              );
            } else if (state is CartFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
