import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostSlider extends StatelessWidget {
  const PostSlider({super.key, required this.imageUrlList});
  final List<String> imageUrlList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
          options: CarouselOptions(
              height: 350, viewportFraction: 1, enableInfiniteScroll: false),
          items: imageUrlList
              .map((imageUrl) => CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    imageUrl: imageUrl, // Replace with your URL
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    // errorWidget: (context, url, error) => Icon(Icons.error),
                  ))
              .toList()),
    );
  }
}
