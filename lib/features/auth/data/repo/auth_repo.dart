import 'package:dartz/dartz.dart';

import '../models/forget_pass_model.dart';
import '../models/sign_in_model/sign_in_model.dart';
import '../models/sign_up_model/sign_up_model.dart';
import '../models/user_model/user_model.dart';

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
  Future<ForgetPassModel> forgetPass({
    required String email,
  });
  Future<ForgetPassModel> verifyResetCode({
    required String resetCode,
  });

  Future<ForgetPassModel> changePass({
    required String oldPass,
    required String newPass,
    required String reNewPass,
  });

  Future<ForgetPassModel> reSetPass({
    required String email,
    required String newPass,
  });

  Future<ForgetPassModel> updateUserData({
    required String email,
    required String pass,
    required String phone,
  });
  Future<UserModel> getAllUser();
}
