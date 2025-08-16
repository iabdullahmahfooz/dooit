import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:flutter/material.dart';
import 'views/get_started_screen/get_started_screen.dart';
import 'views/login_screen/login_screen.dart';
import 'views/signup_screen/signup_screen.dart';
import 'views/forget_password_screen/forget_password_screen.dart';
import 'views/new_password_screen/new_password_screen.dart';
import 'views/home_screen/home_screen.dart';

void main() {
  runApp(const DooitApp());
}

class DooitApp extends StatelessWidget {
  const DooitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignupScreen(),
        '/forget_password_screen': (context) => const ForgetPasswordScreen(),
        '/new_password_screen': (context) => const CreateNewPasswordScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
