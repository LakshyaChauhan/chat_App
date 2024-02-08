// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/services/chat/chat.services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/utils/messag_form.dart';

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

  // for text field focus
  FocusNode myFocusNode = FocusNode();

  // scroll Controller
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // add listner to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          const Duration(
            milliseconds: 50,
          ),
          () => scrollDown(),
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () => scrollDown());
    super.initState();
  }

  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void sendMessage() async {
    // check if there is someting inside textController
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(widget.userId, _messageController.text);
    }
    // clear text controller
    _messageController.clear();
    scrollDown();
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
      body: Column(
        children: [
          // const MessageBox(),
          Expanded(child: _buildMessageList()),
          // a list view where messages will be shown

          // we will have the text field and button to send the message
          MessageForm(
            controller: _messageController,
            sendMessage: sendMessage,
            focusNode: myFocusNode,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _chatServices.firebaseAuth.currentUser!.uid;
    print(senderId);
    print(widget.userId);
    return StreamBuilder<QuerySnapshot>(
        stream: _chatServices.getMessages(senderId, widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['message']),
                  );
                })
                .toList()
                .cast(),
          );
        });
  }
}
