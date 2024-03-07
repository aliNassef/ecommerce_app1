import 'package:ecommerce_app/features/product_details/presentation/manger/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_list/data/models/product_list_model/datum.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.data});
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(),
        child: ProductDetailsViewBody(data: data),
      ),
    );
  }
}
