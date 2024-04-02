// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/services/chat/chat.services.dart';
import 'package:chat_app/utils/messageBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/utils/messag_form.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userId;
  final String profilePic;

  const ChatScreen(
      {super.key,
      required this.userName,
      required this.userId,
      required this.profilePic});

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
            milliseconds: 30,
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
    String? text = _messageController.text.toString();
    _messageController.clear();
    scrollDown();

    // check if there is someting inside textController
    if (text.trim() != '') {
      await _chatServices.sendMessage(widget.userId, text);
    }
    // clear text controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // leading: const Icon(Icons.person),
        title: Row(
          children: [
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
              imageUrl: widget.profilePic,
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black38,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),

            const SizedBox(width: 10),
            //email
            Text(
              widget.userName,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background image (place your desired asset here)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/new.jpeg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Chat content (messages and message form)
          Positioned.fill(
            child: Column(
              children: [
                Expanded(child: _buildMessageList()),
                // a list view where messages will be shown

                MessageForm(
                  controller: _messageController,
                  sendMessage: sendMessage,
                  focusNode: myFocusNode,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _chatServices.firebaseAuth.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: _chatServices.getInitialMessages(senderId, widget.userId),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                .map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return MessageBox(data: data);
                  },
                )
                .toList()
                .cast(),
          );
        });
  }
}
