import 'package:flutter/material.dart';
import 'package:senflix/screens/login_screen.dart';
import 'package:senflix/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '',
      routes: {
        '':(context) => const LoginScreen(),
        'welcome_screen': (context) => const WelcomeScreen(),

      },
    );
  }
}
