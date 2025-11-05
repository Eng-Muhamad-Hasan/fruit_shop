
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_shop/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/api_keys.dart';

abstract class AuthService {}

class FirebaseAuthService extends AuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // log(
      //   'FirebaseAuthException in createUserWithEmailAndPassword: ${e.code} and ${e.message}',
      // );
      if (e.code == 'weak-password') {
        throw CustomExceptions(
          'كلمة المرور ضعيفة جداً, يرجى اختيار كلمة مرور أقوى',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions('لديك حساب مسبقاً، يرجى تسجيل الدخول');
      } else if (e.code == 'invalid-email') {
        throw CustomExceptions('! البريد الإلكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          'لا يوجد اتصال بالإنترنت، يرجى التحقق من الاتصال والمحاولة مرة أخرى',
        );
      } else {
        throw CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
      }
    } catch (e) {
      throw CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // log(
      //   'FirebaseAuthException in signInWithEmailAndPassword: ${e.code} and ${e.message}',
      // );
      if (e.code == 'user-not-found') {
        throw CustomExceptions('لا يوجد مستخدم بهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions('كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(
          'لا يوجد اتصال بالإنترنت، يرجى التحقق من الاتصال والمحاولة مرة أخرى',
        );
      } else {
        throw CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
      }
    } catch (e) {
      throw CustomExceptions("حدث خطأ ما، يرجى المحاولة وقت اخر");
    }
  }

  Future<User> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      clientId: kGoogleClientId,
      serverClientId: kGoogleServerClientId,
    );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  bool isLogIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
  // Future<User> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  // }
}

class SupabaseAuthService extends AuthService {
  // Implement Supabase authentication methods here
}
