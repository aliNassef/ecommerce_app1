import 'package:ecommerce_app/features/authantication/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationState> {
  AuthanticationCubit(this.user) : super(AuthanticationState());
  final AuthRepo user;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpRepassword = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  signUp() async {
    emit(LoadingAuthantication());
    final response = await user.signUp(
      name: signUpName.text,
      pass: signUpPassword.text,
      email: signUpEmail.text,
      phone: signUpPhone.text,
    );
    response.fold(
      (l) => emit(SuccessAuthantication()),
      (r) => emit(
        FailureAuthantication(
          errMessage: r,
        ),
      ),
    );
  }
}
