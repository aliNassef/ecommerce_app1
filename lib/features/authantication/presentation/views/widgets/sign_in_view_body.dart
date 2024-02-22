import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_forget_pass_button.dart';
import 'custom_text_button.dart';
import 'custom_text_form_field.dart';
import 'sign_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 91.h,
            ),
            Image.asset(
              ImageData.route,
              width: 237.w,
              fit: BoxFit.fill,
              height: 71.1.h,
            ),
            SizedBox(
              height: 86.9.h,
            ),
            Text(
              'Welcome Back To Route',
              style: Styles.textStyle24,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Please sign in with your mail',
              style: Styles.textStyle16,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'User Name',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFormField(
              hint: 'enter your name',
              suffixIcon: Image.asset(
                ImageData.eyeSlash,
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              'Password',
              style: Styles.textStyle18.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextFormField(
              hint: 'enter your password',
              hold: true,
              suffixIcon: Image.asset(
                ImageData.eyeSlash,
                height: 24,
                width: 24,
              ),
            ),
            const CustomForgetPassButton(),
            SizedBox(
              height: 56.h,
            ),
            const SignButton(text: 'Login'),
            SizedBox(
              height: 32.h,
            ),
            const CustomTextButton(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
