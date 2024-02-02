import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //icons
              const Icon(Icons.person),

              // email
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
