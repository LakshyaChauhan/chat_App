import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:chat_app/screens/home/profile_screen.dart';
import 'package:chat_app/utils/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 1;

  final List<Widget> _pages = [
    const ChatScreen(),
    const Center(
      child: Text('kamehameha'),
    ),
    const ProfileScreen()
  ];

  @override
  void initState() {
    initializeSharedPrefs();
    super.initState();
  }

  void initializeSharedPrefs() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.getUserFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    void changeIndex(int index) {
      _index = index;
      setState(() {});
    }

    return Scaffold(
      bottomNavigationBar: CustomNavBar(changeIndex: changeIndex),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Chat App',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _pages[_index],
    );
  }
}
