// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/services/chat/chat.services.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/utils/messag_form.dart';
import 'package:chat_app/utils/messageBox.dart';

class ChatScreen extends StatefulWidget {
  final String emailUser;
  final String userId;

  const ChatScreen({
    super.key,
    required this.emailUser,
    required this.userId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void sendMessage() async {
    // check if there is someting inside textController
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(
          widget.emailUser, _messageController.text);
    }
    // clear text controller
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        // leading: const Icon(Icons.person),
        title: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 10),
            //email
            Text(widget.emailUser),
          ],
        ),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MessageBox(),
            // a list view where messages will be shown

            // we will have the text field and button to send the message
            MessageForm(controller: _messageController,sendMessage: sendMessage),
          ],
        ),
      ),
    );
  }
}
