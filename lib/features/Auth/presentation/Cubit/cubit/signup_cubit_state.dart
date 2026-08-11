part of 'signup_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class SignupLoading extends SignupCubitState {}

final class SignupSuccess extends SignupCubitState {
  final UserEntity userEntity;

  SignupSuccess(this.userEntity);
}

final class SignupFailure extends SignupCubitState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
}
