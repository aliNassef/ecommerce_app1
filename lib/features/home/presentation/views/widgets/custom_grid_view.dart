import 'package:ecommerce_app/features/home/presentation/views/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'grid_view_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: const GridViewItem(),
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ProductlistView(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          );
        },
      ),
    );
  }
}
