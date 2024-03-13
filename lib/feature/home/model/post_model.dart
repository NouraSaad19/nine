import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;
  String uid;
  String content;
  String? imageUrl;

  PostModel(
      {this.postId, required this.uid, required this.content, this.imageUrl});

  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return PostModel(
      postId: snapshot.id,
      uid: data?['uid'] ?? '',
      content: data?['content'] ?? '',
      imageUrl: data?['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'uid': uid,
      'content': content,
      'imageUrl': imageUrl,
    };
  }
}
