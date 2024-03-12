import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/views/widgets/custom_app_bar.dart';
import 'favorite_item.dart';

class FavoritViewBody extends StatelessWidget {
  const FavoritViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 24.h,
          ),
          const FavoriteItem(),
        ],
      ),
    );
  }
}
