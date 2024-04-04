import 'package:chat_app/models/comment.dart';
import 'package:chat_app/models/posts_model.dart';
import 'package:chat_app/screens/home/posts/post.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<List<PostsModel>> _fetchFriendPosts() async {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    // List<String> imageUrl = [userProvider.user!.profilePic!];
    return SingleChildScrollView(
      child: Column(
        children: [
          Post(
            post: PostsModel(
              uid: userProvider.user!.uid!,
              imageUrl: ['', ''],
              timestamp: DateTime.now(),
              comments: [
                Comment(
                  uid: userProvider.user!.uid!,
                  content: 'Nice picture',
                  timestamp: DateTime.now(),
                ),
              ],
            ),
          ),
          Post(
            post: PostsModel(
              uid: userProvider.user!.uid!,
              imageUrl: ['', ''],
              timestamp: DateTime.now(),
              comments: [
                Comment(
                  uid: userProvider.user!.uid!,
                  content: 'Nice picture',
                  timestamp: DateTime.now(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // FutureBuilder<List<PostsModel>>(
    //   future: _fetchFriendPosts(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final posts = snapshot.data!;
    //       return ListView.builder(
    //         itemCount: posts.length,
    //         itemBuilder: (context, index) => Post(
    //           post: posts[index],
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Text('Error : ${snapshot.hasError}'),
    //       );
    //     } else {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}
