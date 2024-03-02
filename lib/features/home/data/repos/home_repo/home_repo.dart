import 'package:dartz/dartz.dart';

import '../../models/categorey_model/categorey_model.dart';

abstract class HomeRepo {
  Future<Either<List<CategoreyModel>, String>> getCategory();
  Future<Either<List<CategoreyModel>, String>> getBrands();
}
