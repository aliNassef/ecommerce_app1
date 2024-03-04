import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/helper/awesome_dialog_method.dart';
import '../manger/authantication/authantication_cubit.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthanticationCubit, AuthState>(
      listener: (context, state) {
        if (state is LoadingSignUp) {
          isLoading = true;
        } else if (state is SuccessSignUp) {
          GoRouter.of(context).push('HomeView');
          isLoading = false;
        } else if (state is FailureSignUp) {
          awesomeDialogMethod(context, state.errMessage).show();
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const Scaffold(
            body: SignUpViewBody(),
          ),
        );
      },
    );
  }
}
