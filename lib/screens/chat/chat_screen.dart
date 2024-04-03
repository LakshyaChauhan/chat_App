import 'package:chat_app/screens/chat/chat.dart';
import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/services/chat/chat.services.dart';
import 'package:chat_app/utils/user.tile.dart';
import 'package:flutter/material.dart';

const Color bottomNavBarColor = Color(0xFF17203A);

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatServices chatServices = ChatServices();

  final AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return _builUnderList();
  }

  Widget _builUnderList() {
    return StreamBuilder(
        stream: chatServices.getUserStream(),
        builder: (context, snapshot) {
          //errot
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // return ListView
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                  (user) => _buildUserListItem(user, context),
                )
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    return UserTile(
      text: userData['userName'],
      profilePic: userData['profilePic'],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(
                userId: userData['uid'],
                userName: userData['userName'],
                profilePic: userData['profilePic']),
          ),
        );
      },
    );
  }
}
