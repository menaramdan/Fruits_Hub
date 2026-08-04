import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.email,
    required super.password,
  });

  factory UserModel.firebaseuseruser(User user) {
    return UserModel(
      username: user.displayName ?? '',
      email: user.email ?? '',
      password: user.email ?? '',
    );
  }
}
