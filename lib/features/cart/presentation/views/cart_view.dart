import 'package:ecommerce_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_cart_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomCartAppBar(),
      body: CartViewBody(),
    );
  }
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CartItem(),
          ],
        ),
      ),
    );
  }
}



   