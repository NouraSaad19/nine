import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String? email;
  final String? displayName;
  final String? photoURL;

  UserModel({
    this.id,
    this.email,
    this.displayName,
    this.photoURL,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      email: doc.data().toString().contains('email') ? doc['email'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email};
  }
}
