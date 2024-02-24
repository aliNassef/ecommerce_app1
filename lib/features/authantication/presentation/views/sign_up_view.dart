import 'package:ecommerce_app/core/api/server_locator.dart';
import 'package:ecommerce_app/features/authantication/data/repo/auth_repo_impl.dart';
import 'package:ecommerce_app/features/authantication/presentation/manger/authantication/authantication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthanticationCubit(
          getIt.get<AuthRepoImpl>(),
        ),
        child: const SignUpViewBody(),
      ),
    );
  }
}
