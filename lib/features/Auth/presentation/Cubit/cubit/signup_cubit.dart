import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

part 'signup_cubit_state.dart';

class SignupCubitCubit extends Cubit<SignupCubitState> {
  final AuthRepo authRepo;
  SignupCubitCubit(this.authRepo) : super(SignupCubitInitial());

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
