import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String uid;
  String content;
  String? imageUrl;

  PostModel({
    required this.uid,
    required this.content,
    this.imageUrl,
  });

  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return PostModel(
      uid: snapshot.id,
      content: data?['content'] ?? '',
      imageUrl: data?['imageUrl'],
    );
  }
}

