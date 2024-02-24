import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationInitial> {
  AuthanticationCubit() : super(AuthanticationInitial());

  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpRepassword = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  signUp() async {}
}
