import 'package:flutter/material.dart';

import 'widgets/custom_app_bar.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: ProductDetailsViewBody(),
    );
  }
}
