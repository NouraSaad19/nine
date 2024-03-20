import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? commentId;
  String uid;
  String commentContent;
  String postId;

  CommentModel({
    this.commentId,
    required this.uid,
    required this.commentContent,
    required this.postId,
  });

  factory CommentModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return CommentModel(
      commentId: snapshot.id,
      uid: data?['uid'] ?? '',
      commentContent: data?['commentContent'] ?? '',
      postId: data?['postId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'uid': uid,
      'commentContent': commentContent,
      'postId': postId,
    };
  }
}
