import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/utils/common/myButton.dart';
import 'package:chat_app/utils/common/custom_textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final void Function() changeScreen;
  const LoginScreen({super.key, required this.changeScreen});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // void circular page loading
  bool loading = false;

  // controller for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // login function
    Future<void> login(BuildContext context) async {
      AuthServices authServices = AuthServices();
      try {
        await authServices.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
        if (!context.mounted) return;
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // iCon of the app
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.inversePrimary),
            const SizedBox(height: 50),

            // text of welcome
            Text(
              'Welcome , We hope you enjoy chatting.',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16),
            ),

            const SizedBox(height: 25),
            // custom text field for email
            CustomTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(height: 10),

            //custom text field for password
            CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true),
            const SizedBox(height: 20),
            // sign in button
            MyButton(
                loading: loading,
                onTap: () async {
                  loading = true;
                  setState(() {});
                  await login(context);
                  loading = false;
                  setState(() {});
                },
                text: 'Sign In'),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                GestureDetector(
                  onTap: widget.changeScreen,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
