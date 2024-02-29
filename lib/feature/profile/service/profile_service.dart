import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_template/common/model/user_model.dart';
import 'package:flutter_template/core/db/firebase_instance.dart';

class ProfileService {
  UserModel? getUserInfo({
    required String uid,
    //required Function(String?) onDone,
    required Function(String e) onError,
  }) {
    try {
      final user = FirebaseInstance.firebaseAuth.currentUser;
      print(user?.email);
      if (uid.isNotEmpty) {
        return UserModel(
          id: user?.uid,
          email: user?.email,
          displayName: user?.displayName,
          photoURL: user?.photoURL,
        );
      }
      print('service :${user?.email}');
    } on FirebaseException catch (e) {
      onError(e.message.toString());
    }
  }
}
