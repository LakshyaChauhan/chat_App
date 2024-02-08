import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller;
  final Function() sendMessage;
  final FocusNode? focusNode;

  MessageForm(
      {super.key,
      required this.controller,
      required this.sendMessage,
      this.focusNode});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: TextFormField(
                focusNode: focusNode,
                controller: controller,
                maxLines: null,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim() == '') {
                    return 'Please enter something first';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    hintText: 'Enter your message..'),
              ),
            ),
          ),
        ),
        // Button to send the message
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // here we will have a function of our sending the text
              sendMessage();
            }
          },
          child: TextButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(eccentricity: 0.2),
                backgroundColor: Theme.of(context).colorScheme.onBackground),
            onPressed: sendMessage,
            child: const Icon(
              Icons.send,
              size: 35,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
