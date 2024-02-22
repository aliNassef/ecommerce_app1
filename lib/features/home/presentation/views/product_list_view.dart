import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_app_bar.dart';

class ProductlistView extends StatelessWidget {
  const ProductlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductlistViewBody();
  }
}

class ProductlistViewBody extends StatelessWidget {
  const ProductlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 180 / 273,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return const CustomProduct();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
