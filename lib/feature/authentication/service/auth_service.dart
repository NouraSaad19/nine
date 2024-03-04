import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_template/core/db/firebase_instance.dart';
import 'package:get/get.dart';

class AuthService {
  signUpWithEmailFirebase({
    required String email,
    required String password,
    required String name,
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      UserCredential credential =
          await FirebaseInstance.firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        credential.user?.updateDisplayName(name);
      }
      FirebaseInstance.firebaseAuth.currentUser!.sendEmailVerification();
      onDone(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }

  loginWithEmailFirebase({
    required String email,
    required String password,
    required Function(String?) onDone,
    required Function(String e) onError,
  }) async {
    try {
      UserCredential credential =
          await FirebaseInstance.firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (FirebaseInstance.firebaseAuth.currentUser!.emailVerified) {
        onDone(credential.user?.uid);
      } else {
        Get.snackbar('', 'الرجاء التوجه على بريدك الاكتروني و تفعيل الحساب');
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }

// forgotPassword({
//   required String email,
//   required Function(String e) onError,
// }) async {
//   try {
//     await FirebaseInstance.firebaseAuth.sendPasswordResetEmail(email: email);
//   } on FirebaseAuthException catch (e) {
//     onError(e.message.toString());
//   }
// }
}
