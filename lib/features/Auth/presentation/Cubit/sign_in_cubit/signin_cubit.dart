import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/Auth/Domain/auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithPassword(email, password);
    result.fold(
      ifLeft: (failure) {
        emit(SigninFailure(failure.message));
      },
      ifRight: (user) {
        emit(SigninSuccess(user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      ifLeft: (failure) {
        emit(SigninFailure(failure.message));
      },
      ifRight: (user) {
        emit(SigninSuccess(user));
      },
    );
  }

  Future<void> signInWithFacebook()async{
      emit(SigninLoading());
      var result = await authRepo.signInWithFacebook();
      result.fold(ifLeft: (Failure){
        emit(SigninFailure(Failure.message));
      }, ifRight:(user) {
        emit(SigninSuccess(user));
      },);


  }
}
