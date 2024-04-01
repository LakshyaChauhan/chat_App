import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    void logOut() {
      final authService = AuthServices();
      authService.signOut();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Icon(Icons.message,
                    size: 60, color: Theme.of(context).colorScheme.primary),
              ))
              // icon of the app
              // home app
              ,
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('H O M E'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // settings icon
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('S E T T I N G S'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          // logout icon
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('L O G O U T'),
                onTap: () {
                  // print(Provider.of<UserProvider>(context, listen: false).user);
                  logOut();
                }),
          )
        ],
      ),
    );
  }
}
