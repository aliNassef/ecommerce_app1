part of 'authantication_cubit.dart';

final class AuthanticationState {}

final class AuthanticationInitial extends AuthanticationState {}

final class LoadingAuthantication extends AuthanticationState {}

final class SuccessAuthantication extends AuthanticationState {}

final class FailureAuthantication extends AuthanticationState {
  final String errMessage;

  FailureAuthantication({required this.errMessage});
}
