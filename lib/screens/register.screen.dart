import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/utils/common/myButton.dart';
import 'package:chat_app/utils/common/custom_textField.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final void Function() changeScreen;
  const RegisterScreen({super.key, required this.changeScreen});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // void circular page loading
  bool loading = false;

  // controller for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // void signup method

    Future<void> signup(BuildContext context) async {
      final auth = AuthServices();

      // if email and confirm password is same
      if (passwordController.text == confirmPasswordController.text) {
        try {
          await auth.signUp(emailController.text, passwordController.text);
          // good practice
          if (!context.mounted) return;
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }

      // if not same
      else {
        showDialog(
            context: context,
            builder: (context) =>
                const AlertDialog(title: Text('Passwords dont\'t match')));
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
            MyButton(
                loading: loading,
                onTap: () async {
                  loading = true;
                  setState(() {});
                  await signup(context);
                  loading = false;
                  setState(() {});
                },
                text: 'Sign Up'),
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
                  onTap: widget.changeScreen,
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
