import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_model/data.dart';

abstract class CartRepo {
  Future<Either<List<Data>, String>> getCartProducts();
  Future<void> addProductToCart({required String id});
  removeSpecificCartItem({required String id});
  updateCartProductQuantity({required int count});
}
