import 'package:get_it/get_it.dart';
import 'package:new_app/core/service/auth_firebase_service.dart';
import 'package:new_app/features/Auth/Data/Auth_repo_imple.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';

final getit = GetIt.instance;

void setupGetIt() {
  getit.registerSingleton<AuthFirebaseService>(AuthFirebaseService());
  getit.registerSingleton<AuthRepo>(
    AuthRepoImple(getit<AuthFirebaseService>()),
  );
}
