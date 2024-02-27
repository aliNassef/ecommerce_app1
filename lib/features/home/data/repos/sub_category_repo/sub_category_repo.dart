import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/sub_category_model/sub_category_model.dart';

abstract class SubCategoryRepo {
  Future<Either<List<SubCategoryModel>, String>> fetchAllSubCategories();
}
