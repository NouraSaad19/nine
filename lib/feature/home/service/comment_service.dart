import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/db/firebase_instance.dart';
import '../model/comment_model.dart';

class CommentService {
  Future<List<CommentModel>> getCommentsForPost(String postId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseInstance.fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .get();

      return querySnapshot.docs
          .map((doc) => CommentModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }

  Future<void> addCommentToPost({
    required String postId,
    required CommentModel comment,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .add(comment.toJson());
    } catch (e) {
      print(e);
    }
  }
}
