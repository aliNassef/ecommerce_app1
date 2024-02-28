import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo.dart';

part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthState> {
  AuthanticationCubit(this.user) : super(AuthState());
  final AuthRepo user;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpRepassword = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  signUp() async {
    emit(LoadingSignUp());
    final response = await user.signUp(
      name: signUpName.text,
      pass: signUpPassword.text,
      email: signUpEmail.text,
      phone: signUpPhone.text,
    );
    response.fold(
      (l) => emit(SuccessSignUp()),
      (r) => emit(
        FailureSignUp(
          errMessage: r,
        ),
      ),
    );
  }

  signIn() async {
    emit(LoadingSignIn());
    final response = await user.signIn(
      pass: signInPassword.text,
      email: signInEmail.text,
    );
    response.fold(
      (l) => emit(SuccessSignIn()),
      (r) => emit(
        FailureSignIn(
          errMessage: r,
        ),
      ),
    );
  }
}
