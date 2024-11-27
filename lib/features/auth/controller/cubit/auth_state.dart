part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

// ignore: must_be_immutable
final class FailedToRegisterstate extends AuthState {
  String message;
  FailedToRegisterstate({required this.message});
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

// ignore: must_be_immutable
final class FailedToLoginstate extends AuthState {
  String message;
  FailedToLoginstate({required this.message});
}


final class ChangePasswordLoadingState extends AuthState {}

// ignore: must_be_immutable
final class ChangePasswordSuccessState extends AuthState {
  String message;
  ChangePasswordSuccessState({required this.message});
}

// ignore: must_be_immutable
final class FailedToChangePasswordstate extends AuthState {
  String erroe;
  FailedToChangePasswordstate({required this.erroe});
}