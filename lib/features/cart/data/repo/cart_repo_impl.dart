import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model/data.dart';
import 'package:ecommerce_app/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  @override
  Future<void> addProductToCart({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<List<Data>, String>> getCartProduct() {
    throw UnimplementedError();
  }

  @override
  removeSpecificCartItem({required String id}) {
    throw UnimplementedError();
  }

  @override
  updateCartProductQuantity({required int count}) {
    throw UnimplementedError();
  }
}
