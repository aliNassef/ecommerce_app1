import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';

abstract class ProductListRepo {
  Future<Either<List<Datum>, String>> getAllProduct();
}
