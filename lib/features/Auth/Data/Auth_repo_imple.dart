import 'package:dart_either/dart_either.dart';
import 'package:new_app/core/errors/failure.dart';
import 'package:new_app/core/service/auth_firebase_service.dart';
import 'package:new_app/features/Auth/Data/models/user_model.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

class AuthRepoImple extends AuthRepo {
  final AuthFirebaseService authFirebaseService;
  AuthRepoImple(this.authFirebaseService);
  @override
  Future<Either<Failure, UserEntity>> createuserwithemailandpassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      var user = await authFirebaseService.createPasswordBasedAccount(
        email,
        password,
        username,
      );
      return Right(UserModel.firebaseuseruser(user));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
