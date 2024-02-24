import 'package:ecommerce_app/features/authantication/presentation/manger/authantication/authantication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/sign_in_view_body.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthanticationCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessSignIn) {
          isLoading = true;
          context.go('/HomeView');
          isLoading = false;
        } else if (state is FailureSignIn) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
          isLoading = false;
        } else if (state is LoadingSignUp) {
          isLoading = true;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: const Scaffold(
          body: SignInViewBody(),
        ),
      ),
    );
  }
}
