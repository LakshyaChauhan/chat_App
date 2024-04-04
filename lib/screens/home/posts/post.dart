import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/models/posts_model.dart';
import 'package:chat_app/screens/home/posts/post_icons.dart';
import 'package:chat_app/screens/home/posts/post_slider.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final PostsModel post;
  const Post({super.key, required this.post});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/my-chat-app-f5fc3.appspot.com/o/eeavO29tytbMiNeFCKswhpItxZ73%2FIMG-20240322-WA0004.jpg?alt=media&token=c6f44e6f-f3cf-4892-80b7-c9c042f66616',
                  errorWidget: (context, url, error) => const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black38,
                    child: Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                user!.userName,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const Divider(color: Colors.white12),
          const PostSlider(
            imageUrlList: [
              'https://firebasestorage.googleapis.com/v0/b/my-chat-app-f5fc3.appspot.com/o/eeavO29tytbMiNeFCKswhpItxZ73%2FIMG-20240322-WA0004.jpg?alt=media&token=c6f44e6f-f3cf-4892-80b7-c9c042f66616'
            ],
          ),
          const PostIcons()
        ],
      ),
    );
  }
}
