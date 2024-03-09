import 'package:dartz/dartz.dart';
import '../models/cart_model/cart_model.dart';

abstract class CartRepo {
  Future<Either<CartModel, String>> getCartProducts();
  Future< String> addProductToCart({required String id});
  removeSpecificCartItem({required String id});
  updateCartProductQuantity({required int count});
}
