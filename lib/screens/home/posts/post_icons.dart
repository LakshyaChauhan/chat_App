import 'package:flutter/material.dart';

class PostIcons extends StatefulWidget {
  const PostIcons({super.key});
  @override
  State<PostIcons> createState() => _PostIconsState();
}

class _PostIconsState extends State<PostIcons> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.library_add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.library_add))
            ],
          ),
          const Align(
              alignment: Alignment.centerLeft, child: Text('23432 Likes')),
          GestureDetector(
            onTap: () {
              showMore = !showMore;
              setState(() {});
            },
            child: showMore
                ? const Text(
                    'sbfjsbdfbsdhbfsb bsdbfjsdbf bshbjhbs hbfhb sdfbjsdbf jsbb sbfb jsdbf bsfb \n sdhfbjsbfsb j\n svfjdfhsfhsfh \n ',
                  )
                : const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'sbfjsbdfbsdhbfsb bsdbfjsdbf bshbjhbs hbfhb sdfbjsdbf jsbb sbfb jsdbf bsfb \n sdhfbjsbfsb j\n svfjdfhsfhsfh \t more ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'show more',
                        style: TextStyle(color: Colors.white24),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
