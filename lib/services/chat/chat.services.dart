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
}
