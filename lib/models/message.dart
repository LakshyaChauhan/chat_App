import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String recieverId;
  final String message;
  final Timestamp timestamp;


  Message(
      {required this.senderID,
      required this.recieverId,
      required this.message,
      required this.timestamp});
// }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderID': senderID,
      'recieverId': recieverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
