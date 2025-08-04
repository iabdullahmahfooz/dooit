import 'package:flutter/material.dart';
import 'views/get_started_screen/get_started_screen.dart';
import 'views/login_screen/login_screen.dart';
import 'views/signup_screen/signup_screen.dart';

void main() {
  runApp(const DooitApp());
}

class DooitApp extends StatelessWidget {
  const DooitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dooit',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFA726), // Light Orange
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFA726),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
      },
    );
  }
}
