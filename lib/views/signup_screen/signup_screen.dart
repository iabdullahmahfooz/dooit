import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),

            // Full Name Field
            const Text('Full Name'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'eg Abdullah Jatt',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 30),

            // Email Field Reuseable Widget
            const EmailInputField(),

            const SizedBox(height: 40),

            // Password Field
            const Text('Password'),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '*************',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),

            const SizedBox(height: 40),

            // Signup Button
            CustomButton(label: 'Sign Up', onTap: () {}),

            const SizedBox(height: 80),

            // Social login text
            const Center(child: Text('OR LOGIN WITH:')),

            const SizedBox(height: 40),

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

            // Bottom Login Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/login_screen'),
                  child: const Text(
                    'Login',
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
