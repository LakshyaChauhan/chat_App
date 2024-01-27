import 'package:chat_app/utils/myButton.dart';
import 'package:chat_app/utils/custom_textField.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final void Function() changeScreen;
  const RegisterScreen({super.key,required this.changeScreen});

  @override
  Widget build(BuildContext context) {
    // controller for email and password
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // iCon of the app
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 50),

            // text of welcome
            Text(
              'Welcome , We hope you enjoy chatting.',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
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
            const SizedBox(height: 10),
            // custom field for confirm password
            CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true),

            const SizedBox(height: 20),
            // sign in button
            MyButton(onTap: () {}, text: 'Sign Up'),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: changeScreen,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
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
