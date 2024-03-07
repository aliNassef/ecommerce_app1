import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/product_details/presentation/manger/product_details_cubit/product_details_state.dart';
import 'package:ecommerce_app/features/product_details/presentation/views/widgets/carsousel_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../product_list/data/models/product_list_model/datum.dart';
import 'custom_add_to_cart_button.dart';
import 'number_of_items.dart';
import 'sizes_container.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.data});
  final Datum data;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarsouselImages(images: widget.data.images!),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.title!,
                        style: Styles.textStyle18.copyWith(
                          color: kTextColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      'EGP ${widget.data.price}',
                      style: Styles.textStyle18.copyWith(
                        color: kTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 102.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff004182),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '${widget.data.sold} Sold',
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow,
                    ),
                    Text(
                      '${widget.data.ratingsAverage} (${widget.data.ratingsQuantity})',
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 48.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 42.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: NumberOfItems(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Description',
                  style: Styles.textStyle18.copyWith(
                    color: kTextColor,
                  ),
                ),
                ReadMoreText(
                  widget.data.description!,
                  trimLines: 2,
                  style: Styles.textStyle14.copyWith(
                    color: const Color(0xff06004F).withOpacity(0.6),
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                  ),
                  trimLength: 2,
                  colorClickableText: kTextColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: ' less',
                  moreStyle: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Size',
                  style: Styles.textStyle18.copyWith(
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const SizesContainer(),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Color',
                  style: Styles.textStyle18.copyWith(
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: MediaQuery.of(context).size.width,
                  child: widget.data.availableColors != null
                      ? ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              backgroundColor:
                                  widget.data.availableColors?[index],
                            );
                          },
                        )
                      : Text(
                          'this is the only color availabale',
                          style: Styles.textStyle18.copyWith(
                            color: kTextColor,
                          ),
                        ),
                ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total price',
                          style: Styles.textStyle18.copyWith(
                            color: const Color(0xff06004F).withOpacity(0.6),
                          ),
                        ),
                        Text(
                          '${context.read<ProductDetailsCubit>().increment * widget.data.price!} EGP',
                          style: Styles.textStyle18.copyWith(
                            color: kTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 33.w,
                    ),
                    const CustomAddToCartButton(),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
