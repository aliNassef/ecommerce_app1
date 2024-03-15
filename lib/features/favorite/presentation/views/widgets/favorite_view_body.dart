import 'package:ecommerce_app/features/favorite/presentation/manger/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/custom_app_bar.dart';
import '../../../data/models/fav_model/datum.dart';
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

  List<Datum> filterList = [];
  List<Datum> favProducts = [];
  final textController = TextEditingController();

  void addValueToSearchItem(value) {
    filterList = favProducts
        .where(
          (item) => item.title!.toLowerCase().startsWith(value),
        )
        .toList();

    debugPrint('--------${filterList.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            onChanged: (value) {
              addValueToSearchItem(value);
            },
            textController: textController,
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: BlocConsumer<FavCubit, FavState>(
              listener: (context, state) {
                if (state is FavLoaded) {
                  favProducts = state.favModel.data!;
                }
              },
              builder: (context, state) {
                if (state is FavLoaded) {
                  return ListView.builder(
                    itemCount: textController.text.isEmpty
                        ? favProducts.length
                        : filterList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        child: FavoriteItem(
                          data: textController.text.isEmpty
                              ? favProducts[index]
                              : filterList[index],
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
