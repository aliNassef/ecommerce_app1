import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/home/data/models/sub_category_model/sub_category_model.dart';
import 'package:ecommerce_app/features/home/data/repos/sub_category_repo/sub_category_repo.dart';

class SubCategoryRepoImpl implements SubCategoryRepo {
  final ApiConsumer api;

  SubCategoryRepoImpl({required this.api});

  @override
  Future<Either<List<SubCategoryModel>, String>> fetchAllSubCategories() async {
    try {
      final data = await api.get(EndPoint.allSubCategories);
      List<SubCategoryModel> subCategories = [];
      for (var item in data['data']) {
        subCategories.add(SubCategoryModel.fromJson(item));
      }

      return Left(subCategories);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
