// ignore_for_file: file_names

import 'package:dart_either/dart_either.dart';
import 'package:new_app/core/errors/failure.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createuserwithemailandpassword(
    String email,
    String password,
    String username,
  );

  Future<Either<Failure, UserEntity>> signInWithPassword(
    String email,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
