import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/screens/home/posts/post_slider.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostUploadScreen extends StatefulWidget {
  const PostUploadScreen({
    super.key,
  });
  // final PostsModel post;

  @override
  State<PostUploadScreen> createState() => _PostUploadScreenState();
}

class _PostUploadScreenState extends State<PostUploadScreen> {
  List<File>? fileList;

  Future<List<File>> pickImagesAndVideos() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Allows both images and videos
      allowMultiple: true, // Enable multiple selection
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      return files;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return Column(
      children: [
        // Post(post: widget.post)
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
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
                TextButton(
                  onPressed: () async {
                    fileList = await pickImagesAndVideos();
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white12),
            const PostSlider(
              imageUrlList: [
                'https://firebasestorage.googleapis.com/v0/b/my-chat-app-f5fc3.appspot.com/o/eeavO29tytbMiNeFCKswhpItxZ73%2FIMG-20240322-WA0004.jpg?alt=media&token=c6f44e6f-f3cf-4892-80b7-c9c042f66616'
              ],
            ),
          ],
        ),
      ],
    );
  }
}
