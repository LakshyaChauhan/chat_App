import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  /// we will initialize firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs
          .where((doc) => doc.id != firebaseAuth.currentUser!.uid)
          .map((doc) {
        // got through each individual user
        final user = doc.data();
        print(user);
        return user;
      }).toList();
    });
  }

  // send messages between two users
  Future<void> sendMessage(String recieverId, String message) async {
    // get the user info
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final Timestamp timestamps = Timestamp.now();

    // create a new message
    Message newMessage = Message(
        senderID: currentUserId,
        recieverId: recieverId,
        message: message,
        timestamp: timestamps);

    // create a chat room for two users
    List<String> ids = [currentUserId, recieverId];
    ids.sort();
    String chatRoomId = ids.join('_');
    await firestore
        .collection('ChatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
    // add new message to database
  }

  // get the message
  Stream<QuerySnapshot<Map<String, dynamic>>> getInitialMessages(
      String userId, String recieverId) {
    //construct chatroom id
    List<String> ids = [userId, recieverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return firestore
        .collection('ChatRooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
    // .listen((snapshot) {});
  }
}
