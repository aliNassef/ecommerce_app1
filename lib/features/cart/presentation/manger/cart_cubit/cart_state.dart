part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartModel cartItems;

  const CartSuccess({required this.cartItems});
}

class CartFailure extends CartState {
  final String errMessage;

  const CartFailure({required this.errMessage});
}

class AddProducttoCartLoading extends CartState {}

class AddProducttoCartSuccess extends CartState {}

class AddProducttoCartFailure extends CartState {
  final String errMessage;

  const AddProducttoCartFailure({required this.errMessage});
}

class UpdatedCart extends CartState {
  final CartModel cartModel;

  const UpdatedCart({required this.cartModel});
}

class UpdateCount extends CartState {}
