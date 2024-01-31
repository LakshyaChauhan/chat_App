import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  /// we will initialize firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // got through each individual user
        final user = doc.data();

        return user;
      }).toList();
    });
  }
}
