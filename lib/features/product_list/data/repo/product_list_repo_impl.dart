import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/product_list/data/models/product_list_model/datum.dart';
import 'package:ecommerce_app/features/product_list/data/repo/product_list_repo.dart';

class ProductListRepoImpl extends ProductListRepo {
  final ApiConsumer api;

  ProductListRepoImpl({required this.api});
  @override
  Future<Either<List<Datum>, String>> getAllProduct() async {
    try {
      var data = await api.get(EndPoint.allProduct);
      List<Datum> products = [];
      for (var item in data['data']) {
        products.add(Datum.fromJson(item));
      }
      return Left(products);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }
}
