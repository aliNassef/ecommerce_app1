import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_ponits.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/favorite/data/models/fav_model/fav_model.dart';
import 'package:ecommerce_app/features/favorite/data/repo/fav_repo.dart';
import 'package:flutter/material.dart';

class FavRepoImpl extends FavRepo {
  final ApiConsumer api;

  FavRepoImpl({required this.api});
  @override
  Future<Either<FavModel, String>> getFavProducts() async {
    try {
      final response = await api.get(
        EndPoint.wishList,
      );
      var data = FavModel.fromJson(response);
      return Left(data);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<void> addProdductToFav({required String id}) async {
    try {
      await api.post(EndPoint.wishList, data: {
        ApiKey.productId: id,
      });
    } on ServerException catch (e) {
      debugPrint('${e.errModel.message}');
    }
  }

  @override
  Future<void> removeProdductFromFav({required String id}) async {
    try {
      await api.delete('${EndPoint.wishList}/$id');
    } on ServerException catch (e) {
      debugPrint('${e.errModel.message}');
    }
  }
}