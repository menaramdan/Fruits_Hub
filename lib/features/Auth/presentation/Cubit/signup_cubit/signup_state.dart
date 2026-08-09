part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;
  SignupSuccess(this.user);
}

final class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure(this.errorMessage);
}

final class Logininitial extends SignupState {}

final class LoginSuccess extends SignupState {
  final UserEntity userEntity;

  LoginSuccess(this.userEntity);
}

final class LoginLoading extends SignupState {}

final class LoginFailure extends SignupState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
