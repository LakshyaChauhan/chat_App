import 'package:chat_app/utils/my_switch.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
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
    );
  }
}
