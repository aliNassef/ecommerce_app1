import 'package:ecommerce_app/features/auth/presentation/manger/authantication/authantication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_text_form_fiels_setting.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var email = context.read<AuthanticationCubit>().signInEmail;
    var pass = context.read<AuthanticationCubit>().signInPassword;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageData.routeAppBar,
              height: 22.h,
              fit: BoxFit.fill,
              width: 66.w,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Welcome, Mohamed',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              email.text,
              style: Styles.textStyle14.copyWith(
                color: const Color(0xff06004F),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Your full name',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Your E-mail',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Your password',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Your mobile number',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Your Address',
              style: Styles.textStyle18.copyWith(
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomTextFormField(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
