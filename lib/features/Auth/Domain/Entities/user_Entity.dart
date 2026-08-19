class UserEntity {
  final username;
  final String email;
  final String uid;
  UserEntity({required this.username, required this.email, required this.uid});

  Map<String, dynamic> toMap() {
    return {'username': username, 'email': email, 'uid': uid};
  }
}
