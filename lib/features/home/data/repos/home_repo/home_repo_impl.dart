import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';

import 'package:ecommerce_app/features/home/data/repos/home_repo/home_repo.dart';

import '../../models/categorey_model/categorey_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});
  @override
  Future<Either<List<CategoreyModel>, String>> getCategory() async {
    try {
      final response = await api.get(EndPoint.allCategories);

      List<CategoreyModel> categories = [];
      for (var item in response[ApiKey.data]) {
        categories.add(CategoreyModel.fromJson(item));
      }
      return Left(categories);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<List<CategoreyModel>, String>> getBrands() async {
    try {
      final data = await api.get(EndPoint.brands);
      List<CategoreyModel> categoryBrand = [];
      for (var item in data[ApiKey.data]) {
        categoryBrand.add(CategoreyModel.fromJson(item));
      }
      return Left(categoryBrand);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
