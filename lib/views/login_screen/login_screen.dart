import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),

            // Email Field Reusable widget
            const EmailInputField(),

            const SizedBox(height: 40),

            // Password Field Reusable Widget
            const PasswordInputField(),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/forget_password_screen'),
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),

            const SizedBox(height: 10),
            // Login Button
            CustomButton(label: 'Login', onTap: () {}),

            const SizedBox(height: 120),

            // Social login text
            const Center(child: Text('OR LOGIN WITH:')),

            const SizedBox(height: 30),

            // Social Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/icons/facebook_icon.png', height: 42),
                const SizedBox(width: 34),
                Image.asset('lib/assets/icons/apple_icon.png', height: 42),
                const SizedBox(width: 34),
                Image.asset('lib/assets/icons/google_icon.png', height: 42),
              ],
            ),

            const Spacer(),

            // Bottom Signup Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/signup_screen'),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
