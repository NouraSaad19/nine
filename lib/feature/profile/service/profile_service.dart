import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_template/common/model/user_model.dart';
import 'package:flutter_template/core/db/firebase_instance.dart';

class ProfileService {
  User? user = FirebaseInstance.firebaseAuth.currentUser;
  UserModel? getUserInfo({
    required Function(String e) onError,
  }) {
    try {
      return UserModel(
        id: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        photoURL: user?.photoURL,
      );
    } on FirebaseException catch (e) {
      onError(e.message.toString());
    }
  }

  Future<void> updateUserName({
    required String userName,
    required Function() onDone,
    required Function(String? error) onError,
  }) async {
    try {
      await user?.updateDisplayName(userName);
      onDone();
    } on FirebaseException catch (e) {
      onError(e.message);
    }
  }

  Future<String?> uploadImage({
    required pickedFile,
    required String? uid,
  }) async {
    try {
      String imageUrl = '';
      if (pickedFile != null) {
        final ref = FirebaseInstance.firebaseStorage.ref().child('$uid.jpg');
        await ref.putFile(pickedFile);
        imageUrl = await ref.getDownloadURL();
      }
      return imageUrl;
    } on FirebaseException catch (e) {
      return throw e;
    }
  }

  Future<void> updateUserPhoto({
    required String uid,
    required pickedFile,
    required Function() onDone,
    required Function(String? error) onError,
  }) async {
    try {
      if (uid.isNotEmpty && pickedFile != null) {
        String? image = await uploadImage(pickedFile: pickedFile, uid: uid);
        await user?.updatePhotoURL(image);
        onDone();
      }
    } on FirebaseException catch (e) {
      onError(e.message);
    }
  }

  Future<void> signOut({
    required Function() onDone,
    required Function(String) onError,
  }) async {
    try {
      await FirebaseInstance.firebaseAuth.signOut();
      onDone();
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    }
  }
}
