import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<UserProvider>(context, listen: false).user!;
    print(userProvider.uid);
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            imageUrl: userProvider.profilePic!,
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black38,
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            userProvider.userName,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const Icon(Icons.new_label),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: const Column(
        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(height: 10),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           // text of the thing
        //           Text(
        //             'Dark Mode',
        //             style: TextStyle(fontSize: 20),
        //           ),

        //           // the slider widget
        //           MySwitch(),
        //         ],
        const Divider(
          color: Colors.white24,
        )
      ],
    );
  }
}
