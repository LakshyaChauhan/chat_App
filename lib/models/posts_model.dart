
import 'dart:convert';

import 'package:chat_app/models/comment.dart';

class PostsModel {
  final String uid;
  final List<String> imageUrl;
  final String? content;
  final int likeCounts;
  final bool isLikedByUser;
  final DateTime timestamp;
  final List<Comment> comments;

  PostsModel({
    required this.uid,
    required this.imageUrl,
    required this.timestamp,
    required this.comments,
    this.content,
    this.likeCounts =0 ,
    this.isLikedByUser = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'imageUrl': imageUrl,
      'content': content,
      'likeCounts': likeCounts,
      'isLikedByUser': isLikedByUser,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      uid: map['uid'] as String,
      imageUrl: List<String>.from(map['imageUrl'] ?? []),
      content: map['content'] != null ? map['content'] as String : null,
      likeCounts: map['likeCounts'] as int? ?? 0,
      isLikedByUser: map['isLikedByUser'] as bool? ?? false,
      timestamp: DateTime.parse(map['timestamp'] as String),
      comments: List<Comment>.from(
        map['comments']?.map((commentMap) => Comment.fromMap(commentMap)) ?? [],
      ),
    );
  } 

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) =>
      PostsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
