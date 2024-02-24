import 'package:dartz/dartz.dart';

import '../models/sign_in_model/sign_in_model.dart';
import '../models/sign_up_model/sign_up_model.dart';

abstract class AuthRepo {
  Future<Either<SignUpModel, String>> signUp({
    required String name,
    required String pass,
    required String email,
    required String phone,
  });
  Future<Either<SignInModel, String>> signIn({
    required String email,
    required String pass,
  });
}
