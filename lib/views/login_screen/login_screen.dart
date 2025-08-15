import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/static_assets.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard on tap
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppUnits.px24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppUnits.y40, // large top space

                const Text(
                  'Login to your account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),

                AppUnits.y40,

                // Email Field
                const EmailInputField(),

                AppUnits.y40,

                // Password Field
                const Text('Password'),
                AppUnits.y8,
                const PasswordInputField(),

                AppUnits.y12,

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

                AppUnits.y12,

                // Login Button
                CustomButton(label: 'Login', onTap: () {}),

                AppUnits.y64,

                // Social login text
                const Center(child: Text('OR LOGIN WITH:')),

                AppUnits.y24,

                // Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(StaticAssets.fbIcon, height: 42),
                    AppUnits.x32,
                    Image.asset(StaticAssets.appleIcon, height: 42),
                    AppUnits.x32,
                    Image.asset(StaticAssets.googleIcon, height: 42),
                  ],
                ),

                AppUnits.y40,

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

                AppUnits.y24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
