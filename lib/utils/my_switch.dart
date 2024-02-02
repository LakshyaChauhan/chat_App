import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CupertinoSwitch(
      value: themeProvider.isDarkMode,
      onChanged: (value) => themeProvider.toogleTheme(value),
      activeColor:
          CupertinoColors.activeGreen, // Optional: Customize active color
    );
  }
}
