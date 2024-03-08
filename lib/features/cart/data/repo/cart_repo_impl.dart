import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model/data.dart';
import 'package:ecommerce_app/features/cart/data/repo/cart_repo.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';

class CartRepoImpl extends CartRepo {
  final ApiConsumer api;
  CartRepoImpl({required this.api});

  @override
  Future<Either<List<Data>, String>> addProductToCart(
      {required String id}) async {
    try {
      final response = await api.post(EndPoint.addProductToCart, data: {
        ApiKey.productId: id,
      });
      var data = response[ApiKey.data];
      List<Data> cartItems = [];
      for (var item in data) {
        cartItems.add(Data.fromJson(item));
      }
      return Left(cartItems);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<List<Data>, String>> getCartProducts() async {
    try {
      final response = await api.get(EndPoint.addProductToCart);
      var data = response[ApiKey.data];
      List<Data> cartItems = [];
      for (var item in data) {
        cartItems.add(Data.fromJson(item));
      }
      return Left(cartItems);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  removeSpecificCartItem({required String id}) {
      
  }

  @override
  updateCartProductQuantity({required int count}) {
    throw UnimplementedError();
  }
}
