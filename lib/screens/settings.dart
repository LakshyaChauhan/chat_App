import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:chat_app/utils/my_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<UserProvider>(context, listen: false).user!;
    print(userProvider.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const Divider(),
          CircleAvatar(
            radius: 50,
            child: CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              imageUrl: userProvider.profilePic!,
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black38,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // text of the thing
                    Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 20),
                    ),

                    // the slider widget
                    MySwitch(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
