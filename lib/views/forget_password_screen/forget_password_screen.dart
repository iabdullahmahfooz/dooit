import 'package:flutter/material.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Back Arrow (outside padding to align fully left)
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Main content with padding
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Reset your password',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Enter your email address to receive password reset instructions.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 42),

                  const EmailInputField(),

                  const Spacer(),

                  CustomButton(
                    label: 'Next',
                    onTap: () =>
                        Navigator.pushNamed(context, '/create-new-password'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
