import 'package:flutter/material.dart';
import 'package:dooit/views/get_started_screen/get_started_screen.dart';
import 'package:dooit/views/login_screen/login_screen.dart';
import 'package:dooit/views/signup_screen/signup_screen.dart';
import 'package:dooit/views/forget_password_screen/forget_password_screen.dart';
import 'package:dooit/views/new_password_screen/new_password_screen.dart';
import 'package:dooit/views/home_screen/home_screen.dart';

class AppRoutes {
  static const String getStarted = '/get_started';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget_password';
  static const String newPassword = '/new_password';
  static const String home = '/home';

  // ✅ Simple routes map (no switch, no generateRoute)
  static Map<String, WidgetBuilder> routes = {
    getStarted: (context) => const GetStartedScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    newPassword: (context) => const NewPasswordScreen(),
    home: (context) => const HomeScreen(),
  };
}
