import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';

import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo.dart';

import '../../models/categorey_model/categorey_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  Future<Either<List<CategoreyModel>, String>> getCategory() async {
    try {
      final response = await api.get('api/v1/categories');

      List<CategoreyModel> categories = [];
      for (var item in response['data']) {
        categories.add(CategoreyModel.fromJson(item));
      }
      return Left(categories);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
