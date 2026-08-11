import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/Auth/Domain/auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

part 'signup_cubit_state.dart';

class SignupCubitCubit extends Cubit<SignupCubitState> {
  final AuthRepo authRepo;
  SignupCubitCubit(this.authRepo) : super(SignupCubitInitial());

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
