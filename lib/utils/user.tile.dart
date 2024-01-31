import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const UserTile({super.key, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(2),
      ),child: Row(children: [
        //icons 
        const Icon(Icons.person),

        // email 
        Text(text),
      ],) ,
    ),);
  }
}
