import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/cache/cache_helper.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/forget_pass_model.dart';
import '../models/sign_in_model/sign_in_model.dart';
import '../models/sign_up_model/sign_up_model.dart';
import '../models/user_model/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<SignUpModel, String>> signUp({
    required String name,
    required String pass,
    required String email,
    required String phone,
  }) async {
    try {
      var response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.email: email,
          ApiKey.name: name,
          ApiKey.password: pass,
          ApiKey.phone: phone,
        },
      );
      final user = SignUpModel.fromJson(response);
      return Left(user);
    } on ServerException catch (e) {
      return Right(e.errModel.errors?.msg ?? e.errModel.message!);
    }
  }

  @override
  Future<Either<SignInModel, String>> signIn({
    required String email,
    required String pass,
  }) async {
    try {
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
      });
      final user = SignInModel.fromJson(response);
      var userId = JwtDecoder.decode(user.token!);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: userId[ApiKey.id]);

      return Left(user);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<ForgetPassModel> forgetPass({required String email}) async {
    final respone = await api.post(
      EndPoint.forgetPass,
      data: {
        ApiKey.email: email,
      },
    );
    final user = ForgetPassModel.fromJson(respone);
    return user;
  }

  @override
  Future<ForgetPassModel> verifyResetCode({required String resetCode}) async {
    final respone = await api.post(
      EndPoint.verifyResetCode,
      data: {
        ApiKey.email: resetCode,
      },
    );
    final user = ForgetPassModel.fromJson(respone);
    return user;
  }

  @override
  Future<ForgetPassModel> changePass(
      {required String oldPass,
      required String newPass,
      required String reNewPass}) async {
    final response = await api.patch(EndPoint.changePass, data: {
      ApiKey.currentPassword: oldPass,
      ApiKey.password: newPass,
      ApiKey.repass: reNewPass,
    });
    final user = ForgetPassModel.fromJson(response);
    return user;
  }

  @override
  Future<ForgetPassModel> reSetPass(
      {required String email, required String newPass}) async {
    final response = await api.patch(EndPoint.changePass, data: {
      ApiKey.email: email,
      ApiKey.newPass: newPass,
    });
    final user = ForgetPassModel.fromJson(response);
    return user;
  }

  @override
  Future<ForgetPassModel> updateUserData({
    required String email,
    required String pass,
    required String phone,
  }) async {
    final response = await api.patch(EndPoint.updateUser, data: {
      ApiKey.email: email,
      ApiKey.password: pass,
      ApiKey.phone: phone,
    });
    final user = ForgetPassModel.fromJson(response);
    return user;
  }

  @override
  Future<UserModel> getAllUser() async {
    final response = await api.get(EndPoint.allusers);
    final user = UserModel.fromJson(response);
    return user;
  }
}
