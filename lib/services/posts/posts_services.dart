import 'dart:io';

import 'package:chat_app/models/posts_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostsServices {
  // instances of firebasauth and firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<List<String>> uploadPostsTOStorage(
      List<String> filePaths, String uid) async {
    List<String> downloadUrls = [];
    for (String filepath in filePaths) {
      try {
        final fileName = filepath.split('/').last;
        final reference = _firebaseStorage.ref().child('$uid/posts/$fileName');
        final task = reference.putFile(File(filepath));
        final snapshot = await task.whenComplete(() => null);
        final url = await snapshot.ref.getDownloadURL();
        downloadUrls.add(url);
      } on FirebaseException catch (e) {
        print(
            'You are getting error WHILE UPLOADING IMAGES OR POSTS TO FIREBASE STORAGE');
        throw Exception(e.code);
      }
    }
    return downloadUrls;
  }

  Future<void> uploadPost(
    PostsModel post,
  ) async {
    try {
      List<String> downloadUrls =
          await uploadPostsTOStorage(post.imageUrl, post.uid);
      PostsModel newPost = PostsModel(
        uid: post.uid,
        imageUrl: downloadUrls,
        timestamp: post.timestamp,
        comments: post.comments,
        content: post.content,
      );
      await _firebaseFirestore
          .collection('Posts')
          .doc(newPost.uid)
          .set(newPost.toMap());
    } on FirebaseAuthException catch (e) {
      print('Error in the uploadin post secction of the code.');
      throw Exception(e.code);
    }
  }
}
