import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthServices {
  // instances of firebasauth and firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _firebaseFirestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .update({'isOnline': true});
      final data = await _firebaseFirestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .get() as Map<String, dynamic>;
      final currentUser = Provider.of<UserProvider>(context, listen: false);
      currentUser.user = UserModel.fromMap(data);
      print(currentUser);
    } on FirebaseAuthException catch (e) {
      print('The error is in the authentication login section of the program');
      throw Exception(e.code);
    }
  }

  // sign up or register
  Future<UserCredential> signUp(UserModel userModel, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userModel.email, password: password);

      await _firebaseFirestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      await _firebaseFirestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .update({'uid': userCredential.user!.uid});

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error in signup method in AuthServices.dart file');
      throw Exception(e.code);
    }
  }

  // sign out or log out
  Future<void> signOut(BuildContext context) async {
    String uid = Provider.of<UserProvider>(context).user!.uid!;
    await _firebaseFirestore
        .collection('Users')
        .doc(uid)
        .update({'isOnline': false});
    return await _auth.signOut();
  }
}
