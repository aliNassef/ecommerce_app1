import 'package:flutter/material.dart';
import 'widgets/product_list_view_body.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ProductListViewBody()),
    );
  }
}
