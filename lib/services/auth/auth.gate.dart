import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/login/login.or.register.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {

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
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LoginOrRegisterPage();
            }
          }),
    );
  }
}
