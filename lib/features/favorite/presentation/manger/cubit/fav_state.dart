part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavLoaded extends FavState {
  final FavModel favModel;

  const FavLoaded({required this.favModel});
}

final class FavFailure extends FavState {
  final String errMessage;

  const FavFailure({required this.errMessage});
}
