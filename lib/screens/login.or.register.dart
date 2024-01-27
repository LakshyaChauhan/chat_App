import 'package:chat_app/screens/login.screen.dart';
import 'package:chat_app/screens/register.screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void changePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        changeScreen: changePages,
      );
    } else {
      return RegisterScreen(
        changeScreen: changePages,
      );
    }
  }
}
