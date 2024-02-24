import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/authantication/data/models/sign_up_model/sign_up_model.dart';
import 'package:ecommerce_app/features/authantication/data/repo/auth_repo.dart';

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
      var response = await api.post(EndPoint.signUp, data: {
        ApiKey.email: email,
        ApiKey.name: name,
        ApiKey.password: pass,
        ApiKey.phone: phone,
      });
      final user = SignUpModel.fromJson(response);
      return Left(user);
    } on ServerException catch (e) {
      return Right(e.errModel.message !);
    }
  }
}
