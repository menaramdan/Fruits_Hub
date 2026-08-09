part of 'signup_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class Logininitial extends SignupCubitState {}

final class LoginSuccess extends SignupCubitState {
  final UserEntity userEntity;

  LoginSuccess(this.userEntity);
}

final class LoginLoading extends SignupCubitState {}

final class LoginFailure extends SignupCubitState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
