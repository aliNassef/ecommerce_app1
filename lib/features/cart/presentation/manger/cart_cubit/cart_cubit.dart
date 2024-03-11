import 'package:ecommerce_app/features/cart/data/repo/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  CartModel? cartModel;
  int count = 1;
  addProductToCart({required String id}) async {
    emit(AddProducttoCartLoading());
    try {
      await cartRepo.addProductToCart(id: id);
      emit(AddProducttoCartSuccess());
    } catch (e) {
      emit(AddProducttoCartFailure(errMessage: e.toString()));
    }
  }

  getCartProducts() async {
    emit(CartLoading());
    var data = await cartRepo.getCartProducts();
    cartModel = data.fold((l) => l, (r) => null);
    debugPrint('t=print it  $cartModel');
    data.fold(
      (l) => emit(CartSuccess(cartItems: l)),
      (r) => emit(CartFailure(errMessage: r)),
    );
  }

  deleteSpecificItem({required String id}) async {
    emit(CartLoading());
    var result = await cartRepo.removeSpecificCartItem(id: id);
    result.fold(
      (l) => emit(CartSuccess(cartItems: l)),
      (r) => emit(CartFailure(errMessage: r)),
    );
  }

  updatedCountOfProduct({required String id, required int count}) async {
    emit(CartLoading());
    if (count != 0) {
      var resault = await cartRepo.updateCartProductQuantity(
        count: count,
        id: id,
      );
      resault.fold(
        (l) => emit(
          CartSuccess(cartItems: l),
        ),
        (r) => emit(CartFailure(errMessage: r)),
      );
    } else {
      var resault = await cartRepo.updateCartProductQuantity(
        count: 1,
        id: id,
      );
      resault.fold(
        (l) => emit(
          CartSuccess(cartItems: l),
        ),
        (r) => emit(CartFailure(errMessage: r)),
      );
    }
  }
}
