import 'package:chat_app/screens/provider/user_provider.dart';
import 'package:chat_app/services/auth/auth.gate.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/themes/dark.mode.dart';
import 'package:chat_app/themes/light.mode.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await themeProvider.loadThemeMode();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => themeProvider),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider()..getUserFromSharedPreferences(),
          lazy: true,
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeProvider.themeMode,
      home: const AuthGate(),
    );
  }
}
