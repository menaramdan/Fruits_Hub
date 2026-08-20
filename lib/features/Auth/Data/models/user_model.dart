import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/features/Auth/Domain/Entities/user_Entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.username,
    required super.email,
    required super.uid,
  });

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(username: user.username, email: user.email, uid: user.uid);
  }

  factory UserModel.firebaseuseruser(User user) {
    return UserModel(
      username: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'username': username, 'email': email, 'uid': uid};
  }
}
