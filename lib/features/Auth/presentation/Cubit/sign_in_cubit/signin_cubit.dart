import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SignupState> {
  SigninCubit(this.authRepo) : super(SignupInitial());
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
}
