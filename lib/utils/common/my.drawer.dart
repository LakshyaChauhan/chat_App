import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut(BuildContext context) {
    final authService = AuthServices();
    authService.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  logOut(context);
                }),
          )
        ],
      ),
    );
  }
}
