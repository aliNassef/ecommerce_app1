import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
 import 'package:ecommerce_app/features/home/data/repos/sub_category_repo/sub_category_repo.dart';

import '../../models/sub_category_model/datum.dart';

class SubCategoryRepoImpl implements SubCategoryRepo {
  final ApiConsumer api;

  SubCategoryRepoImpl({required this.api});

  @override
  Future<Either<List<Datum>, String>> fetchAllSubCategories() async {
    try {
      final data = await api.get(EndPoint.allSubCategories);
      List<Datum> subCategories = [];
      for (var item in data['data']) {
        subCategories.add(Datum.fromJson(item));
      }

      return Left(subCategories);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
