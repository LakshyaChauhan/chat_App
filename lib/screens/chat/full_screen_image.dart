import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: 'loka',
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black38,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            )),
      ),
    );
  }
}
