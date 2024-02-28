part of 'authantication_cubit.dart';

final class AuthState {}

final class SignUpIntial extends AuthState {}

final class LoadingSignUp extends AuthState {}

final class SuccessSignUp extends AuthState {}

final class FailureSignUp extends AuthState {
  final String errMessage;

  FailureSignUp({required this.errMessage});
}

final class SignInIntial extends AuthState {}

final class LoadingSignIn extends AuthState {}

final class SuccessSignIn extends AuthState {}

final class FailureSignIn extends AuthState {
  final String errMessage;

  FailureSignIn({required this.errMessage});
}
