import 'package:flutter/material.dart';
import 'widgets/cart_view_body.dart';
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
