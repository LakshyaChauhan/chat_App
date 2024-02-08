// ignore: file_names
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [bluebox(), greenbox(context)],
    );
  }

  Widget bluebox() {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 140, 182, 218),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      // color: const Color.fromARGB(255, 140, 182, 218),
      child: const Text(
        'hello dear ',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget greenbox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      // color: const Color.fromARGB(255, 140, 182, 218),
      child: const Text(
        'hello dear',
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
