import 'package:flutter/material.dart';

const Color bottomNavBarColor = Color(0xFF17203A);

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.changeIndex});
  final Function(int) changeIndex;

  @override
  Widget build(BuildContext context) {
    List<int> array = [0, 0, 0];

    return Container(
      padding: const EdgeInsets.all(10),
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: const BoxDecoration(
        color: bottomNavBarColor,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        // boxShadow: [
        //   BoxShadow(
        //     color: bottomNavBarColor.withOpacity(0.8),
        //     offset: const Offset(0, 20),
        //     blurRadius: 20,
        //   )
        // ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              changeIndex(0);
              array[0] = 1;
            },
            icon: const Icon(
              Icons.chat,
              color: Colors.white54,
            ),
          ),
          IconButton(
            onPressed: () {
              changeIndex(1);
            },
            icon: const Icon(
              Icons.home,
              color: Colors.white54,
            ),
          ),
          IconButton(
            onPressed: () {
              changeIndex(2);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white54,
            ),
          ),
          IconButton(
            onPressed: () {
              changeIndex(3);
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white54,
            ),
          )
        ],
        // children: List.generate(
        //     bottomNavItems.length,
        //     (index) => SizedBox(
        //           height: 36,
        //           width: 36,
        //           child: RiveAnimation.asset(
        //             bottomNavItems[index].rive.src,
        //             artboard: bottomNavItems[index].rive.src,
        //           ),
        //         )),
      ),
    );
  }
}
