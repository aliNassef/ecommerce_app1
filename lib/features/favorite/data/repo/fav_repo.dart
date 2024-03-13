import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/favorite/data/models/fav_model/fav_model.dart';

abstract class FavRepo {
  Future<Either<FavModel, String>> getFavProducts();
  Future<void> addProdductToFav({required String id});
  Future<void> removeProdductFromFav({required String id});
}