import 'package:chat_app/utils/messag_form.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String emailUser;
  const ChatScreen({super.key, required this.emailUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 10,
            ),
            //email
            Text(emailUser),
          ],
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('data'),
          // a list view where messages will be shown

          // we will have the text field and button to send the message
           MessageForm(),
          
        ],
      ),
    );
  }
}
