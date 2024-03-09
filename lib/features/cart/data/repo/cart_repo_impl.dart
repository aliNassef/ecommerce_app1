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
  Future<String> addProductToCart({required String id}) async {
    try {
      final response = await api.post(
        EndPoint.getUserCart,
        data: {
          ApiKey.productId: id,
        },
      );

      return response.toString();
    } on ServerException catch (e) {
      return e.errModel.message!;
    }
  }

  @override
  Future<Either<CartModel, String>> getCartProducts() async {
    try {
      final response = await api.get(
        EndPoint.getUserCart,
      );
      var data = CartModel.fromJson(response);
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
