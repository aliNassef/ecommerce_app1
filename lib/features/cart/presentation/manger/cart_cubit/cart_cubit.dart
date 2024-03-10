import 'package:ecommerce_app/features/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

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
}
