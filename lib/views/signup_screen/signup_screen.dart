import 'package:dooit/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // ✅ Dismiss keyboard
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppUnits.px24, // ✅ Consistent side padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppUnits.y40, // ✅ Top spacing
                // Title
                const Text(
                  'Create your account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                AppUnits.y32,

                // Full Name
                const Text('Full Name'),
                AppUnits.y8,
                TextField(
                  decoration: InputDecoration(
                    hintText: 'eg Abdullah Jatt',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: AppUnits.a12,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                  ],
                ),
                AppUnits.y20,

                // Email
                const EmailInputField(),
                AppUnits.y20,

                // Password
                const Text('Password'),
                AppUnits.y8,
                const PasswordInputField(),
                AppUnits.y32,

                // Signup Button
                CustomButton(label: 'Sign Up', onTap: () {}),
                AppUnits.y48,

                // Social login text
                const Center(child: Text('OR SIGN UP WITH:')),
                AppUnits.y20,

                // Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/facebook.png', height: 42),
                    AppUnits.x32,
                    Image.asset('assets/icons/apple.png', height: 42),
                    AppUnits.x32,
                    Image.asset('assets/icons/google.png', height: 42),
                  ],
                ),
                AppUnits.y40,

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

                AppUnits.y20, // ✅ Bottom breathing space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
