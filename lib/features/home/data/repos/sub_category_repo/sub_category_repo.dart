import 'package:dartz/dartz.dart';

import '../../models/sub_category_model/datum.dart';

abstract class SubCategoryRepo {
  Future<Either<List<Datum>, String>> fetchAllSubCategories();
}
