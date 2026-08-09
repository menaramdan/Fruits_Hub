import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(SignupLoading());
    var result = await authRepo.createuserwithemailandpassword(
      email,
      password,
      username,
    );
    result.fold(
      ifLeft: (failure) {
        emit(SignupFailure(failure.message));
      },
      ifRight: (user) {
        emit(SignupSuccess(user));
      },
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.signInWithPassword(email, password);
    result.fold(
      ifLeft: (failure) {
        emit(LoginFailure(failure.message));
      },
      ifRight: (user) {
        emit(LoginSuccess(user));
      },
    );
  }
}
