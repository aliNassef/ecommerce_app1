import 'dart:async';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_app_bar.dart';
import 'custom_category_list_view.dart';
import 'custom_cateory_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _pos = 0;

  Timer? _timer;
  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(
        seconds: 5,
      ),
      (timer) {
        setState(() {
          _pos = (_pos + 1) % kOffers.length;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200.h,
                width: 398.w,
                child: Image.asset(
                  fit: BoxFit.fill,
                  gaplessPlayback: true,
                  kOffers[_pos],
                ),
              ),
              const CustomCategoryButton(),
              const CustomCategoryListView(),
              SizedBox(
                height: 16.h,
              ),
              const CustomCategoryListView(),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Home Appliance',
                    style: Styles.textStyle18.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
