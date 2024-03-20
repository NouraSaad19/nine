import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../common/model/user_model.dart';
import '../../../core/db/firebase_instance.dart';
import '../model/post_model.dart';

class PostService {
  Future<List<PostModel>> getPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseInstance.fireStore.collection('posts').get();
    return querySnapshot.docs.map(PostModel.fromSnapshot).toList();
  }

  Future<void> addPost({
    required PostModel post,
    required File pickedFile,
    required Function() onDone,
    required Function(String e) onError,
  }) async {
    try {
      final postRef = FirebaseInstance.fireStore.collection('posts').doc();
      post.postId = postRef.id;
      String? image = await uploadImagePost(
        pickedFile: pickedFile,
        postId: post.postId,
      );
      print(" add post from service ");
      post.imageUrl = image;
      await postRef.set(post.toJson());
      print(" add post from service ");
      onDone();
    } on FirebaseException catch (e) {
      onError('Firebase Firestore Error: ${e.message}');
    }
  }

  Future<String?> uploadImagePost({
    required File pickedFile,
    required String? postId,
  }) async {
    try {
      String imageUrl = '';

      if (pickedFile != null) {
        final ref = FirebaseInstance.firebaseStorage
            .ref()
            .child('post_images/$postId.jpg');
        await ref.putFile(pickedFile);
        imageUrl = await ref.getDownloadURL();
      }

      return imageUrl;
    } on FirebaseException catch (e) {
      return throw e;
    }
  }

  Future<UserModel> getUserData(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseInstance.fireStore
          .collection('posts')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        return UserModel(
            displayName: userSnapshot['displayName'],
            //  email: userSnapshot['email'],
            photoURL: userSnapshot['']);
      } else {
        throw Exception('User not found');
      }
    } on FirebaseException catch (e) {
      throw Exception('Error fetching user data');
    }
  }
}
