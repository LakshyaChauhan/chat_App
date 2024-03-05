import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String? uid;
  final String userName;
  final String name;
  final String? profilePic;
  final String email;
  final bool  isOnline;
  UserModel({
    this.uid,
    required this.userName,
    required this.name,
    this.profilePic,
    required this.email,
    required this.isOnline,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userName': userName,
      'name':name,
      'profilePic': profilePic,
      'email': email,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromMap( Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      userName: map['userName'] as String,
      name: map['name'] as String,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      email: map['email'] as String,
      isOnline: map['isOnline'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
