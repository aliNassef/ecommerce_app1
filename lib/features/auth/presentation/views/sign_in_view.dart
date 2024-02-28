import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../constants.dart';
import '../../../../core/helper/awesome_dialog_method.dart';
import '../manger/authantication/authantication_cubit.dart';
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
          context.go('/HomeView');
          isLoading = false;
        } else if (state is FailureSignIn) {
          awesomeDialogMethod(context, state.errMessage).show();
          isLoading = false;
        } else if (state is LoadingSignIn) {
          isLoading = true;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        color: kPrimaryColor,
        inAsyncCall: isLoading,
        child: const Scaffold(
          body: SignInViewBody(),
        ),
      ),
    );
  }
}
