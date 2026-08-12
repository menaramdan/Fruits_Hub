import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/core/errors/custom_exception.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  Future<UserCredential> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '353195202717-n33i1cpp9vhocjm2v5iecjisvtbrk861.apps.googleusercontent.com',
    );
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signInWithPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('لا يوجد حساب بهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة.');
      } else {
        throw CustomException('حدث خطأ غير معروف، الرجاء المحاولة لاحقًا.');
      }
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف، الرجاء المحاولة لاحقًا.');
    }
  }

  
Future<UserCredential> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: ['public_profile'],
  );
  if (loginResult.status != LoginStatus.success) {
    throw CustomException(
      'فشل تسجيل الدخول باستخدام Facebook: ${loginResult.status}',
    );
  }

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
}
