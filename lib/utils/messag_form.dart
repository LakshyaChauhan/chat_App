import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: TextFormField(
                maxLines: null,
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
              if (_formKey.currentState!.mounted) {
                // here we will have a function of our sending the text
              }
            },
            child: const Icon(
              Icons.send,
              size: 35,
            ))
      ],
    );
  }
}
