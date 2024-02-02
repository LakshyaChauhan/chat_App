import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/services/chat/chat.services.dart';
import 'package:chat_app/utils/my.drawer.dart';
import 'package:chat_app/utils/user.tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ChatServices chatServices = ChatServices();
  final AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Chat App',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      drawer: const MyDrawer(),
      body: _builUnderList(),
    );
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

          // return List view
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
      text: userData['email'],
      onTap: () {
        print('running this function ${userData['email']}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              emailUser: userData['email'],
            ),
          ),
        );
      },
    );
  }
}
