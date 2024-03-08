import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/cart/data/repo/cart_repo.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../models/cart_model/cart_model.dart';

class CartRepoImpl extends CartRepo {
  final ApiConsumer api;
  CartRepoImpl({required this.api});

  @override
  Future<Either<CartModel, String>> addProductToCart(
      {required String id}) async {
    try {
      final response = await api.post(
        EndPoint.addProductToCart,
        data: {
          ApiKey.productId: id,
        },
      );

      var data = CartModel.fromJson(response[ApiKey.data]);
      return Left(data);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  Future<Either<CartModel, String>> getCartProducts() async {
    try {
      final response = await api.get(
        EndPoint.addProductToCart,
      );
      var data = CartModel.fromJson(response[ApiKey.data]);
      return Left(data);
    } on ServerException catch (e) {
      return Right(e.errModel.message!);
    }
  }

  @override
  removeSpecificCartItem({required String id}) {}

  @override
  updateCartProductQuantity({required int count}) {
    throw UnimplementedError();
  }
}