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
