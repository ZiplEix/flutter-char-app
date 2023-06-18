import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  const Users({
    required this.email,
    required this.uid,
  });

  final String email;
  final String uid;

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
      };

  static Users fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      email: snapshot["email"],
      uid: snapshot["uid"],
    );
  }
}
