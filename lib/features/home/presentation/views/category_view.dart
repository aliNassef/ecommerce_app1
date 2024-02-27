import 'package:flutter/material.dart';

import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(
        child: CategoryViewBody(),
      ),
    );
  }
}