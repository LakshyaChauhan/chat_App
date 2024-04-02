import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/screens/chat/full_screen_image.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            // color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //icons or image
              GestureDetector(
                onTap: () {
                  if (profilePic != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FullScreenImage(imageUrl: profilePic)));
                  }
                },
                child: CircleAvatar(
                  radius: 30,
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    imageUrl: profilePic,
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
                ),
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
