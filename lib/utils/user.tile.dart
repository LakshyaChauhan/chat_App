import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String profilePic;
  final void Function() onTap;
  const UserTile(
      {super.key,
      required this.profilePic,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //icons or image
              profilePic == ''
                  ? const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    )
                  : CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profilePic),
                      backgroundColor: Colors.black38,
                    ),
              const SizedBox(width: 20),
              // email
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
