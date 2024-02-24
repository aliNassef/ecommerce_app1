import 'package:flutter/material.dart';

import 'widgets/category_view_body.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
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
