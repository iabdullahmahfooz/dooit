import 'package:dooit/views/add_task_screen/add_task_screen.dart';
import 'package:dooit/views/verify_email_screen/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:dooit/views/get_started_screen/get_started_screen.dart';
import 'package:dooit/views/login_screen/login_screen.dart';
import 'package:dooit/views/signup_screen/signup_screen.dart';
import 'package:dooit/views/forget_password_screen/forget_password_screen.dart';
import 'package:dooit/views/new_password_screen/new_password_screen.dart';
import 'package:dooit/views/home_screen/home_screen.dart';
import 'package:dooit/views/task_screen/task_screen.dart';

class AppRoutes {
  static const String getStarted = '/get_started_screen';
  static const String login = '/login_screen';
  static const String signup = '/signup_screen';
  static const String forgetPassword = '/forget_password_screen';
  static const String newPassword = '/new_password_screen';
  static const String home = '/home_screen';
  static const String task = '/task_screen';
  static const String addTask = '/add_task_screen';
  static const String verifyEmail = '/verify_email_screen';

  // ✅ Simple routes map (no switch, no generateRoute)
  static Map<String, WidgetBuilder> routes = {
    getStarted: (context) => const GetStartedScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    forgetPassword: (context) => const ForgetPasswordScreen(),
    newPassword: (context) => const NewPasswordScreen(),
    home: (context) => const HomeScreen(),
    task: (context) => const TaskScreen(),
    addTask: (context) => const TaskFormScreen(),
    verifyEmail: (context) => const VerifyEmailScreen(),
  };
}
