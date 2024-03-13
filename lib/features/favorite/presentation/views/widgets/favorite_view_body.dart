import 'package:ecommerce_app/features/favorite/presentation/manger/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/views/widgets/custom_app_bar.dart';
import 'favorite_item.dart';

class FavoritViewBody extends StatefulWidget {
  const FavoritViewBody({super.key});

  @override
  State<FavoritViewBody> createState() => _FavoritViewBodyState();
}

class _FavoritViewBodyState extends State<FavoritViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<FavCubit>().getFavProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (state is FavLoaded) {
                  return ListView.builder(
                    itemCount: state.favModel.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: FavoriteItem(
                          data: state.favModel.data![index],
                        ),
                      );
                    },
                  );
                } else if (state is FavFailure) {
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
          )
        ],
      ),
    );
  }
}
