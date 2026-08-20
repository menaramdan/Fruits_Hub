import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/core/errors/failure.dart';
import 'package:new_app/core/service/auth_firebase_service.dart';
import 'package:new_app/core/services/DataBaseServices.dart';
import 'package:new_app/core/utils/backend_endpoint.dart';
import 'package:new_app/features/Auth/Data/models/user_model.dart';
import 'package:new_app/features/Auth/Domain/auth_repo.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

class AuthRepoImple implements AuthRepo {
  final AuthFirebaseService authFirebaseService;
  final DataBaseServices dataBaseServices;
  AuthRepoImple(this.authFirebaseService, this.dataBaseServices);
  @override
  Future<Either<Failure, UserEntity>> createuserwithemailandpassword(
    String email,
    String password,
    String username,
  ) async {
    User? user;
    try {
      user = await authFirebaseService.createPasswordBasedAccount(
        email,
        password,
        username,
      );
      var userEnitity = UserModel.firebaseuseruser(user);
      await addUserData(user: userEnitity);
      return Right(userEnitity);
    } on Exception catch (e) {
      if (user != null) {
        authFirebaseService.deleteUser();
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithPassword(
    String email,
    String password,
  ) async {
    User user;
    try {
      user = await authFirebaseService.signInWithPassword(email, password);
      var userEnitity = await getUserData(uid: user.uid);

      return Right(userEnitity);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user_ = await authFirebaseService.signInWithGoogle();
      return Right(UserModel.firebaseuseruser(user_.user!));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await authFirebaseService.signInWithFacebook();
      return Right(UserModel.firebaseuseruser(user.user!));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    final usermodel = UserModel.fromEntity(user);
    await dataBaseServices.addData(
      path: BackendEndpoint.endoint,
      data: usermodel.toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userdata = await dataBaseServices.getData(
      path: BackendEndpoint.getuser,
      documentID: uid,
    );
    return UserModel.fromMap(userdata);
  }
}
