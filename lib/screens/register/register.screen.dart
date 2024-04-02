import 'dart:io';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/services/auth/auth.services.dart';
import 'package:chat_app/utils/common/myButton.dart';
import 'package:chat_app/utils/common/custom_textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final void Function() changeScreen;
  const RegisterScreen({super.key, required this.changeScreen});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // void circular page loading
  bool loading = false;

  // image
  File? _imageFile;
  // function to pick image from gallery
  void _pickImage() async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (imageFile != null) {
        _imageFile = File(imageFile.path);
      }
    });
    print(_imageFile);
  }

  // controller for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> signup(BuildContext context) async {
    final auth = AuthServices();

    // if email and confirm password is same
    if (passwordController.text == confirmPasswordController.text) {
      try {
        final UserModel user = await auth.signUp(
            UserModel(
                name: nameController.text,
                userName: userNameController.text,
                email: emailController.text,
                isOnline: false,
                profilePic: _imageFile != null ? _imageFile!.path : ''),
            passwordController.text);
        // good practice
        if (!context.mounted) return;
        Provider.of<UserProvider>(context, listen: false).setUser(user);
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

  @override
  Widget build(BuildContext context) {
    // void signup method

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage:
                      _imageFile != null ? FileImage(_imageFile!) : null,
                  backgroundColor: Colors.grey,
                  child: _imageFile == null
                      ? const Icon(
                          Icons.person,
                          size: 100,
                        )
                      : null,
                ),
              ),

              const SizedBox(height: 20),

              // text of welcome
              Text(
                'Add Profile Picture.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16),
              ),

              const SizedBox(height: 25),
              // user name
              CustomTextField(
                  controller: userNameController,
                  hintText: 'Username',
                  obscureText: false),
              const SizedBox(height: 10),
              // for name
              CustomTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false),
              const SizedBox(height: 10),
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
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: widget.changeScreen,
                    child: Text(
                      'Sign in',
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
      ),
    );
  }
}
