// ignore: file_names
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool loading;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          maximumSize: const Size.fromWidth(double.infinity),
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ));
  }
}
