// ignore: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Map<String, dynamic> data;
  const MessageBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (data['senderID'] == auth.currentUser!.uid) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(right: 20, top: 8, bottom: 8),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 2 + 100),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            // color: const Color.fromARGB(255, 140, 182, 218),
            child: Text(
              data['message'],
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(8),
            constraints: BoxConstraints(
                maxWidth: (MediaQuery.sizeOf(context).width / 2) + 100),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            // color: const Color.fromARGB(255, 140, 182, 218),
            child: Text(
              data['message'],
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      );
    }

    //   Widget bluebox() {
    //     return Container(
    //       padding: const EdgeInsets.all(15),
    //       margin: const EdgeInsets.all(8),
    //       decoration: const BoxDecoration(
    //         color: Color.fromARGB(255, 140, 182, 218),
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
    //       ),
    //       // color: const Color.fromARGB(255, 140, 182, 218),
    //       child: const Text(
    //         'hello dear ',
    //         style: TextStyle(fontSize: 17),
    //       ),
    //     );
    //   }

    //   Widget greenbox(BuildContext context) {
    //     return Container(
    //       padding: const EdgeInsets.all(15),
    //       margin: const EdgeInsets.all(8),
    //       decoration: BoxDecoration(
    //         color: Theme.of(context).colorScheme.onBackground,
    //         borderRadius: const BorderRadius.only(
    //             topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
    //       ),
    //       // color: const Color.fromARGB(255, 140, 182, 218),
    //       child: const Text(
    //         'hello dear',
    //         style: TextStyle(fontSize: 17),
    //       ),
    //     );
    //   }
    // }
  }
}
