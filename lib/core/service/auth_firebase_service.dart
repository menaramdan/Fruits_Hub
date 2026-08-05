import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/core/errors/custom_exception.dart';

class AuthFirebaseService {
  Future<User> createPasswordBasedAccount(
    String email,
    String password,
    String username,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('باسورد ضعيف, الرجاء اختيار باسورد أقوى');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('الحساب موجود بالفعل لهذا البريد الإلكتروني.');
      } else {
        throw CustomException('حدث خطأ غير معروف، الرجاء المحاولة لاحقًا');
      }
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف، الرجاء المحاولة لاحقًا');
    }
  }
}
