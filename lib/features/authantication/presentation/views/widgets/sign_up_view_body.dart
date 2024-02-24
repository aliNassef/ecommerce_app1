import 'package:ecommerce_app/features/authantication/presentation/manger/authantication/authantication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_text_form_field.dart';
import 'sign_button.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthanticationCubit, AuthanticationState>(
      listener: (context, state) {
        if (state is SuccessAuthantication) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Done'),
          ));
        } else if (state is FailureAuthantication) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        if (state is SuccessAuthantication) {
          return const Text('Done');
        } else {
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
                    height: 40.h,
                  ),
                  Text(
                    'Full Name',
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    hint: 'enter your full name',
                    controller: context.read<AuthanticationCubit>().signUpName,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Mobile Number',
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    hint: 'enter your mobile no.',
                    controller: context.read<AuthanticationCubit>().signUpPhone,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'E-mail address',
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    hint: 'enter your email address',
                    controller: context.read<AuthanticationCubit>().signUpEmail,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'Password',
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextFormField(
                    hold: true,
                    hint: 'enter your password',
                    suffixIcon: Image.asset(
                      ImageData.eyeSlash,
                      height: 24,
                      width: 24,
                    ),
                    controller:
                        context.read<AuthanticationCubit>().signUpPassword,
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  SignButton(
                    text: 'Sign up',
                    onTap: () {
                      context.read<AuthanticationCubit>().signUp();
                      // context.go('/HomeView');
                    },
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
