import 'package:flutter/material.dart';
import 'package:dooit/views/get_started_screen/get_started_screen.dart';
import 'package:dooit/views/login_screen/login_screen.dart';
import 'package:dooit/views/signup_screen/signup_screen.dart';
import 'package:dooit/views/forget_password_screen/forget_password_screen.dart';
import 'package:dooit/views/new_password_screen/new_password_screen.dart';
import 'package:dooit/views/home_screen/home_screen.dart';

abstract class AppRoutes {
  static const String getStarted = '/get_started';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget_password';
  static const String newPassword = '/new_password';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case newPassword:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }

  static void pushReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void pushAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
