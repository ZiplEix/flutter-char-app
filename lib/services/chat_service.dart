import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/models/message.dart';
import '../models/users.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // send message
  Future<void> sendMessage(String receiverId, String message) async {
    // get current user info
    final Users currentUser = Users(
      email: _auth.currentUser!.email!,
      uid: _auth.currentUser!.uid,
    );
    final Timestamp timestamp = Timestamp.now();

    // create nex message
    Message msg = Message(
      senderId: currentUser.uid,
      senderEmail: currentUser.email,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // construct a chat room id
    List<String> ids = [currentUser.uid, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    // add new msg to the db
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(msg.toJson());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // construct the chat room id
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
